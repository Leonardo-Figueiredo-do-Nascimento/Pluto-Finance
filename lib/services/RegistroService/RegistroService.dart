

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pluto_finance/models/Registro.dart';

class RegistroService {
  final CollectionReference _registrosRef =
      FirebaseFirestore.instance.collection('registros');

  // CREATE
  Future<void> adicionarRegistro(Registro registro) async {
    DocumentReference docRef = await _registrosRef.add(registro.toJson());
    await docRef.update({'uid': docRef.id});
  }

  // READ (todos os registros de um usuário)
  Future<List<Registro>> listarRegistrosPorUsuario(String usuarioId) async {
    try {
      QuerySnapshot snapshot = await _registrosRef
          .where('usuarioId', isEqualTo: usuarioId)
          .orderBy('dataRegistro', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => Registro.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      if (e.code == 'failed-precondition') {
        // Erro por falta de índice
        print('⚠️ Índice necessário não encontrado. Crie o índice no Firebase Console.');
        print('Link sugerido pelo Firebase: ${e.message}');
      } else {
        print('Erro do Firebase: ${e.message}');
      }
      // Retorna uma lista vazia como fallback
      return [];
    } catch (e) {
      print('Erro inesperado: $e');
      return [];
    }
  }

  // UPDATE
  Future<void> atualizarRegistro(String docId, Registro registro) async {
    await _registrosRef.doc(docId).update(registro.toJson());
  }

  // DELETE
  Future<void> deletarRegistro(String docId) async {
    await _registrosRef.doc(docId).delete();
  }

  // GET por ID do documento
  Future<Registro?> buscarRegistroPorId(String docId) async {
    DocumentSnapshot doc = await _registrosRef.doc(docId).get();
    if (doc.exists) {
      return Registro.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}