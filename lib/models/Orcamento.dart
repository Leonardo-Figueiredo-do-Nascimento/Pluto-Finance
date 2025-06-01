class Orcamento {
  int? orcamentoId;
  int? usuarioId;
  double? orcamento;
  DateTime? orcamentoMes;

  Orcamento({
    this.orcamento,
    this.orcamentoMes,
  });

  factory Orcamento.fromJson(Map<String, dynamic> json) {
    return Orcamento()
      ..orcamentoId = json['uid']
      ..usuarioId = json['usuarioId']
      ..orcamento = json['orcamento']
      ..orcamentoMes = json['orcamentoMes'];
  }
}