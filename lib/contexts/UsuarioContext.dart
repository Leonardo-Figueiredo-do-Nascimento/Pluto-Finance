import 'package:flutter/material.dart';
import 'package:pluto_finance/models/Orcamento.dart';
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
  List<Orcamento> get orcamentos => _usuario.orcamentos;

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
    if(registro.tipo == "Ganho"){
      adicionarSaldo(registro.quantia!);
    } else {
      removerSaldo(registro.quantia!);
    }
    _usuario.registros.add(registro);
    notifyListeners();
  }
  void removerRegistro(Registro registro){
    if(registro.tipo == "Ganho"){
      removerSaldo(registro.quantia!);
    } else {
      adicionarSaldo(registro.quantia!);
    }
    _usuario.registros.remove(registro);
    notifyListeners();
  }
  void adicionarOrcamento(Orcamento _orcamento){
    _usuario.orcamentos.add(_orcamento);
    notifyListeners();
  }
  void removerOrcamento(Orcamento _orcamento){
    _usuario.orcamentos.remove(_orcamento);
    notifyListeners();
  }
  double getOrcamentoMesAtual() {
    DateTime now = DateTime.now();
    Orcamento? orcamentoAtual = _usuario.orcamentos.firstWhere(
      (orcamento) =>
          orcamento.orcamentoMes?.year == now.year &&
          orcamento.orcamentoMes?.month == now.month,
      orElse: () => Orcamento(orcamentoMes: now, orcamento: 0.0), // fallback
    );
    return orcamentoAtual.orcamento!;
  }
  Usuario getUsuario(){
    return _usuario;
  }
  void setUsuario(Usuario usuario){
    _usuario  = usuario;
    notifyListeners();
  }
}