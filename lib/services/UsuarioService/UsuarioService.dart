import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pluto_finance/models/Usuario.dart';

class UsuarioService {
  final CollectionReference _usuariosRef =
      FirebaseFirestore.instance.collection('usuarios');

  // CREATE
  Future<void> adicionarUsuario(Usuario usuario) async {
    await _usuariosRef.add(usuario.toJson());
  }

  // READ (todos os usuários)
  Future<List<Usuario>> listarUsuarios() async {
    QuerySnapshot snapshot = await _usuariosRef.get();

    return snapshot.docs
        .map((doc) => Usuario.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // READ por e-mail (útil para login)
  Future<Usuario?> buscarUsuarioPorEmail(String email) async {
    QuerySnapshot snapshot = await _usuariosRef
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return Usuario.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  // UPDATE
  Future<void> atualizarUsuario(String docId, Usuario usuario) async {
    await _usuariosRef.doc(docId).update(usuario.toJson());
  }

  // DELETE
  Future<void> deletarUsuario(String docId) async {
    await _usuariosRef.doc(docId).delete();
  }

  // READ por ID
  Future<Usuario?> buscarUsuarioPorId(String uid) async {
  try {
    final snapshot = await _usuariosRef.where('uid', isEqualTo: uid).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data() as Map<String, dynamic>;
      return Usuario.fromJson(data);
    }
    return null;
  } catch (e) {
    print('Erro ao buscar usuário por UID: $e');
    return null;
  }
}
}