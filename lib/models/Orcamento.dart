class Orcamento {
  String? orcamentoId;
  String? usuarioId;
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

  Map<String, dynamic> toJson() {
    return {
      'orcamentoId': orcamentoId,
      'usuarioId': usuarioId,
      'orcamento': orcamento,
      'orcamentoMes': orcamentoMes,
    };
  }
}