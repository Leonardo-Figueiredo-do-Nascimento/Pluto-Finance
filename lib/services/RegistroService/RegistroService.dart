

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pluto_finance/models/Registro.dart';

class RegistroService {
  final CollectionReference _registrosRef =
      FirebaseFirestore.instance.collection('registros');

  // CREATE
  Future<void> adicionarRegistro(Registro registro) async {
    await _registrosRef.add(registro.toJson());
  }

  // READ (todos os registros de um usuário)
  Future<List<Registro>> listarRegistros(int usuarioId) async {
    QuerySnapshot snapshot = await _registrosRef
        .where('usuarioId', isEqualTo: usuarioId)
        .orderBy('dataRegistro', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => Registro.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
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