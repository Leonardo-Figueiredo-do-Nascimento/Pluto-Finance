import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_finance/models/Registro.dart';

class CustomPieChart extends StatelessWidget {
  final List<Registro> registros;

  CustomPieChart({required this.registros, super.key});

  final List<Color> categoriaGanhosColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    const Color.fromARGB(255, 54, 244, 235),
    Colors.purple,
  ];
  final List<Color> categoriaDespesasColors = [
    Colors.red,
    const Color.fromARGB(255, 253, 65, 65),
    Colors.orange,
    const Color.fromARGB(255, 255, 251, 1),
    const Color.fromARGB(255, 0, 0, 0),
  ];

  List<PieChartSectionData> _generateSections() {
    if (registros.isEmpty) return [];

    double total = registros.fold(0, (sum, item) => sum + (item.quantia ?? 0));
    
    List<PieChartSectionData> sections = [];
    
    for (int i = 0; i < registros.length; i++) {
      final registro = registros[i];
      final color = registro.tipo == "Ganho" 
          ? categoriaGanhosColors[i % categoriaGanhosColors.length] 
          : categoriaDespesasColors[i % categoriaDespesasColors.length];

      sections.add(
        PieChartSectionData(
          value: (registro.quantia ?? 0) / total * 100, 
          title: "${registro.categoria}: ${registro.quantia!.toStringAsFixed(2)}",
          color: color,
          radius: 50,
          titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }

    return sections;
  }
  
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _generateSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }
}