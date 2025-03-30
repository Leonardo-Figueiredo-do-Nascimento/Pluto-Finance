import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_finance/models/Registro.dart';

class CustomPieChart extends StatelessWidget {
  final List<Registro> registros;

  CustomPieChart({required this.registros, super.key});

  // Cores para categorias de Ganhos
  final Map<String, Color> categoriaGanhosColors = {
    "Salário": Colors.blue,
    "Dividendos": Colors.green,
    "Venda": Colors.orange,
    "Empréstimo": const Color.fromARGB(255, 54, 244, 235),
    "Outros": Colors.purple,
  };

  // Cores para categorias de Despesas
  final Map<String, Color> categoriaDespesasColors = {
    "Moradia": Colors.red,
    "Alimentação": const Color.fromARGB(255, 114, 9, 9),
    "Transporte": Colors.orange,
    "Lazer": const Color.fromARGB(255, 161, 159, 0),
    "Outros": const Color.fromARGB(255, 0, 0, 0),
  };

  List<PieChartSectionData> _generateSections() {
    if (registros.isEmpty) return [];

    double total = registros.fold(0, (sum, item) => sum + (item.quantia ?? 0));

    List<PieChartSectionData> sections = [];

    for (int i = 0; i < registros.length; i++) {
      final registro = registros[i];
      final categoria = registro.categoria;

      Color color;
      // Verifica se é um "Ganho" ou "Despesa" e pega a cor baseada na categoria
      if (registro.tipo == "Ganho") {
        color = categoriaGanhosColors[categoria] ?? categoriaGanhosColors["Outros"]!;
      } else {
        color = categoriaDespesasColors[categoria] ?? categoriaDespesasColors["Outros"]!;
      }

      sections.add(
        PieChartSectionData(
          value: (registro.quantia ?? 0) / total * 100,
          title: "R\$${registro.quantia!.toStringAsFixed(2)}",
          color: color,
          radius: 50,
          titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }

    return sections;
  }

  Widget _buildLegend() {
    Map<String, Color> legendItems = {}; // Dicionário para armazenar as categorias e cores

    for (int i = 0; i < registros.length; i++) {
      final registro = registros[i];
      final categoria = registro.categoria;

      Color color;
      // Verifica se é um "Ganho" ou "Despesa" e pega a cor baseada na categoria
      if (registro.tipo == "Ganho") {
        color = categoriaGanhosColors[categoria] ?? categoriaGanhosColors["Outros"]!;
      } else {
        color = categoriaDespesasColors[categoria] ?? categoriaDespesasColors["Outros"]!;
      }

      legendItems[categoria!] = color;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: legendItems.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: entry.value,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(entry.key, style: const TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 200,
          child: PieChart(
            PieChartData(
              sections: _generateSections(),
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        ),
        const SizedBox(width: 30),
        SizedBox(
          height: 200, // Mantém a altura igual à do gráfico
          child: Center(child: _buildLegend()), // Centraliza a legenda dentro do SizedBox
        ),
      ],
    );
  }
}