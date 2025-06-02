import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Cadastrar usuário
  Future<String?> register(String email, String password, String nome, String telefone) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((res){
        FirebaseFirestore.instance.collection("usuarios").add({
          "uid": res.user!.uid.toString(),
          "nome": nome,
          "telefone": telefone,
          "saldoTotal": 0.00, 
          "email": email,
          "senha": password
        });
      });
      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Login do usuário
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Esqueci a senha
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Usuário atual
  User? get currentUser => _auth.currentUser;
}