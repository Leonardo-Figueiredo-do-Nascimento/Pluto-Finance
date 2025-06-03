import 'package:cloud_firestore/cloud_firestore.dart';

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
      ..orcamento = (json['orcamento'] as num?)?.toDouble()
      ..orcamentoMes = json['orcamentoMes'] is Timestamp
        ? (json['orcamentoMes'] as Timestamp).toDate()
        : (json['orcamentoMes'] is String
            ? DateTime.tryParse(json['orcamentoMes'])
            : null);
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