class Usuario{
  int? usuarioId;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  double saldoTotal = 0.00;

  Usuario({
    int? usuarioId,
    String? nome,
    String? email,
    String? senha,
    String? telefone,
    double carteira = 0.00,
  });
}