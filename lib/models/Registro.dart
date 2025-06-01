class Registro {
  int? registroId;
  int? usuarioId;
  String? tipo;
  double? quantia;
  String? categoria;
  DateTime? dataRegistro;

  Registro({
    this.registroId,
    this.usuarioId,
    this.tipo,
    this.quantia,
    this.categoria,
    this.dataRegistro,
  });

  factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro()
      ..registroId = json['uid']
      ..usuarioId = json['usuarioId']
      ..tipo = json['tipo']
      ..quantia = (json['quantia']).toDouble()
      ..categoria = json['categoria']
      ..dataRegistro = json['dataRegistro'];
  }
}