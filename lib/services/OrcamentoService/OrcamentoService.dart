import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pluto_finance/models/Orcamento.dart';

class OrcamentoService {
  final CollectionReference _orcamentosRef =
      FirebaseFirestore.instance.collection('orcamentos');

  // CREATE
  Future<void> adicionarOrcamento(Orcamento orcamento) async {
    DocumentReference docRef = await _orcamentosRef.add(orcamento.toJson());
    await docRef.update({'orcamentoId': docRef.id});
  }

  // READ (todos os orçamentos de um usuário)
  Future<List<Orcamento>> listarOrcamentosPorUsuario(String usuarioId) async {
    QuerySnapshot snapshot = await _orcamentosRef
        .where('usuarioId', isEqualTo: usuarioId)
        .get();

    return snapshot.docs
        .map((doc) => Orcamento.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // UPDATE
  Future<void> atualizarOrcamento(String docId, Orcamento orcamento) async {
    print("========= ATUALIZANDO ORÇAMENTO =========");
    print("ID buscado: $docId");
    print("Dados enviados: ${orcamento.toJson()}");

    try {
      final snapshot = await _orcamentosRef
          .where('orcamentoId', isEqualTo: orcamento.orcamentoId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final firestoreId = snapshot.docs.first.id;
        print("Documento Firestore encontrado: $firestoreId");

        DocumentReference orcamentoRef = _orcamentosRef.doc(firestoreId);
        await orcamentoRef.set(orcamento.toJson(), SetOptions(merge: true));

        print("✅ Orçamento atualizado com sucesso.");
      } else {
        print("❌ Documento com orcamentoId=$docId não encontrado.");
      }
    } catch (e, s) {
      print("❌ Erro ao atualizar orcamento: $e");
      print(s);
    }
  }


  // DELETE
  Future<void> deletarOrcamento(String docId) async {
    await _orcamentosRef.doc(docId).delete();
  }

  // GET por ID do documento
  Future<Orcamento?> buscarOrcamentoPorId(String docId) async {
    DocumentSnapshot doc = await _orcamentosRef.doc(docId).get();
    if (doc.exists) {
      return Orcamento.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}