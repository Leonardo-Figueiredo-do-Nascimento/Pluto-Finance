

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pluto_finance/models/Registro.dart';
import 'package:pluto_finance/models/Usuario.dart';

class RegistroService {
  final CollectionReference _registrosRef =
      FirebaseFirestore.instance.collection('registros');

  final CollectionReference _usuariosRef =
      FirebaseFirestore.instance.collection('usuarios');    

  // CREATE
  Future<void> adicionarRegistro(Registro registro, {bool despesa = false}) async {
    DocumentReference docRef = await _registrosRef.add(registro.toJson());
    await docRef.update({'uid': docRef.id});

    late final String userUid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await _usuariosRef.where('uid', isEqualTo: userUid).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;

      Usuario usuario = Usuario.fromJson(data);
      if(despesa == true){
        usuario.saldoTotal -= registro.quantia!;
      }else{
        usuario.saldoTotal += registro.quantia!;
      }

      // CORRETO: pega o ID real do documento no Firestore
      DocumentReference usuarioRef = _usuariosRef.doc(doc.id);
      await usuarioRef.update(usuario.toJson());
    } else {
      throw Exception('Usuário não encontrado');
    }
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

  // DELETE
  Future<void> deletarRegistro(String docId, Registro registro,{bool despesa = false}) async {
    await _registrosRef.doc(docId).delete();

    late final String userUid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await _usuariosRef.where('uid', isEqualTo: userUid).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;

      Usuario usuario = Usuario.fromJson(data);
      if(despesa == true){
        usuario.saldoTotal += registro.quantia!;
      } else{
        usuario.saldoTotal -= registro.quantia!;
      }

      // CORRETO: pega o ID real do documento no Firestore
      DocumentReference usuarioRef = _usuariosRef.doc(doc.id);
      await usuarioRef.update(usuario.toJson());
    } else {
      throw Exception('Usuário não encontrado');
    }
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