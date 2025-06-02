import 'package:cloud_firestore/cloud_firestore.dart';

class Registro {
  String? registroId;
  String? usuarioId;
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
    return Registro(
      registroId: json['uid'], // 
      usuarioId: json['usuarioId'],
      tipo: json['tipo'],
      quantia: (json['quantia'] as num?)?.toDouble() ?? 0.0,
      categoria: json['categoria'],
      dataRegistro: json['dataRegistro'] is Timestamp
          ? (json['dataRegistro'] as Timestamp).toDate()
          : (json['dataRegistro'] is String
              ? DateTime.parse(json['dataRegistro'])
              : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': registroId,
      'usuarioId': usuarioId,
      'tipo': tipo,
      'quantia': quantia,
      'categoria': categoria,
      'dataRegistro': dataRegistro,
    };
  }
}