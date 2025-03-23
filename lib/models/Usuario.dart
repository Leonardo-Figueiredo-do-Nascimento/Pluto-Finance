import 'package:pluto_finance/models/Registro.dart';

class Usuario{
  int? usuarioId;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  double saldoTotal = 0.00;
  List<Registro> registros = [];
  
  Usuario();
  
  Usuario.comParametros(
    this.nome,
    this.email,
    this.senha,
    this.telefone,
  );
}