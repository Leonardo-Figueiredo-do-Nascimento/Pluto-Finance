import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pluto_finance/models/Orcamento.dart';

class OrcamentoService {
  final CollectionReference _orcamentosRef =
      FirebaseFirestore.instance.collection('orcamentos');

  // CREATE
  Future<void> adicionarOrcamento(Orcamento orcamento) async {
    await _orcamentosRef.add(orcamento.toJson());
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
    await _orcamentosRef.doc(docId).update(orcamento.toJson());
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