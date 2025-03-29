import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:pluto_finance/widgets/PieChart/CustomPieChart.dart';
import 'package:provider/provider.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  @override
  Widget build(BuildContext context) {
    final usuarioContext = context.read<UsuarioContext>();
    final registros = usuarioContext.registros;
    final ganhosRegistros = registros.where((registro) => registro.tipo == 'Ganho').toList();
    final despesasRegistros = registros.where((registro) => registro.tipo == 'Despesa').toList();
    final ganhosTotal = ganhosRegistros.fold(0.0, (soma, registro) => soma + (registro.quantia!));
    final despesasTotal = despesasRegistros.fold(0.0, (soma, registro) => soma + (registro.quantia ?? 0.0));
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 245, 200, 0)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    Text("Análise",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900)),
                    Divider(),
                  ],
                ),
                SizedBox(height: 100,),
                ganhosRegistros.isNotEmpty ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ganhos",style: TextStyle(color: Colors.white,fontSize: 18)),
                    Divider(),
                    Container(
                      height: 300,
                      width: 300,
                      child: CustomPieChart(registros: ganhosRegistros)
                    )
                  ],
                ) : Column(),
                despesasRegistros.isNotEmpty ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Despesas",style: TextStyle(color: Colors.white,fontSize: 18)),
                    Divider(),
                    Container(
                      height: 300,
                      width: 300,
                      child: CustomPieChart(registros: despesasRegistros)
                    )
                  ],
                ) : Column(),
              ],
            ),
          )
        )
      ),
    );
  }
}