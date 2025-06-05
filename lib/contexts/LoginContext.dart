import 'package:flutter/material.dart';

class LoginContext extends ChangeNotifier {
  String _email = '';
  String _senha = '';

  String get email => _email;
  String get senha => _senha;

  void setEmail(String valor) {
    _email = valor;
    notifyListeners();
  }

  void setSenha(String valor) {
    _senha = valor;
    notifyListeners();
  }
}