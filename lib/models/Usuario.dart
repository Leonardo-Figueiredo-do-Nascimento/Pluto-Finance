class Usuario{
  int? usuarioId;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  double carteira = 0.0;

  Usuario({
    int? usuarioId,
    String? nome,
    String? email,
    String? senha,
    String? telefone,
    double carteira = 0.0,
  });
}