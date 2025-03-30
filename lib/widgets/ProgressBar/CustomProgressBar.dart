import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {

  final double despesasTotais;
  final double orcamento;


  CustomProgressBar({required this.despesasTotais, required this.orcamento,super.key});

  @override
  Widget build(BuildContext context) {

    double progresso = despesasTotais /orcamento;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "R\$${despesasTotais.toStringAsFixed(1)} / R\$$orcamento",
          style: TextStyle(fontSize: 18,color:  despesasTotais > orcamento ? Colors.red : Colors.white ),
        ),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: progresso.clamp(0.0, 1.0),
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ],
    );
  }
}