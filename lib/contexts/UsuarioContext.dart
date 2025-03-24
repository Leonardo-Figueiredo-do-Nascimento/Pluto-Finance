import 'package:flutter/material.dart';
import 'package:pluto_finance/models/Registro.dart';
import 'package:pluto_finance/models/Usuario.dart';

class UsuarioContext extends ChangeNotifier {
  
  Usuario _usuario = Usuario();

  int? get usuarioId => _usuario.usuarioId;
  String? get nome => _usuario.nome;
  String? get email => _usuario.email;
  String? get senha => _usuario.senha;
  String? get telefone => _usuario.telefone;
  double get saldoTotal => _usuario.saldoTotal;
  List<Registro> get registros => _usuario.registros;

  void setUsuarioId(int id) {
    _usuario.usuarioId = id;
    notifyListeners();
  }

  void setNome(String nome) {
    _usuario.nome = nome;
    notifyListeners();
  }

  void setEmail(String email) {
    _usuario.email = email;
    notifyListeners();
  }

  void setSenha(String senha) {
    _usuario.senha = senha;
    notifyListeners();
  }

  void setTelefone(String telefone) {
    _usuario.telefone = telefone;
    notifyListeners();
  }

  void setCarteira(double valor) {
    _usuario.saldoTotal = valor;
    notifyListeners();
  }

  void adicionarSaldo(double valor) {
    _usuario.saldoTotal += valor;
    notifyListeners();
  }

  void removerSaldo(double valor) {
    _usuario.saldoTotal -= valor;
    notifyListeners();
  }
  void adicionarRegistro(Registro registro){
    _usuario.registros.add(registro);
    notifyListeners();
  }
  Usuario getUsuario(){
    return _usuario;
  }
  void setUsuario(Usuario usuario){
    _usuario  = usuario;
    notifyListeners();
  }
}