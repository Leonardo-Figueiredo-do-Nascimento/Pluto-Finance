import 'package:pluto_finance/models/Orcamento.dart';
import 'package:pluto_finance/models/Registro.dart';

class Usuario{
  int? usuarioId;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  double saldoTotal = 0.00;
  List<Registro> registros = [];
  List<Orcamento> orcamentos = [];
  
  Usuario();
  
  Usuario.comParametros(
    this.nome,
    this.email,
    this.senha,
    this.telefone,
  );

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario()
      ..usuarioId = json['uid']
      ..nome = json['nome']
      ..email = json['email']
      ..senha = json['senha']
      ..telefone = json['telefone']
      ..saldoTotal = (json['saldoTotal'] ?? 0).toDouble();
  }
}