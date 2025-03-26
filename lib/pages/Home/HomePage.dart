import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/pages/RegistrarDespesas/RegistrarDespesasPage.dart';
import 'package:pluto_finance/pages/RegistrarGanhos/RegistrarGanhosPage.dart';
import 'package:pluto_finance/pages/Registros/RegistrosPage.dart';
import 'package:pluto_finance/widgets/Drawer/UserDrawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final usuarioContext = context.read<UsuarioContext>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 245, 200, 0)),
      ),
      drawer: const UserDrawer(),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 340,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 190, 155, 0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patrimônio:",style: TextStyle(color: Colors.white,fontSize: 16),),
                      Divider(),
                      Expanded(
                        child: Text(
                          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(usuarioContext.saldoTotal),
                          style: TextStyle(
                            fontSize: 26,
                            color: usuarioContext.saldoTotal < 0.0
                                ? const Color.fromARGB(255, 197, 13, 0)
                                : Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>RegistrarGanhosPage()));
                        }, 
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 32, 138, 0),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 2),
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_upward_sharp, size: 40, color: Colors.white),
                              Expanded(
                                child: Text(
                                  "Registrar Ganhos",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>RegistrarDespesasPage()));
                        }, 
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 2),
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Registrar Despesas",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                              Icon(Icons.arrow_downward_sharp, size: 40, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Últimos Registros",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextButton(
                          onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>RegistrosPage()));}, 
                          child: Container(
                            decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.white,spreadRadius: 2)]),
                            padding: EdgeInsets.all(5),
                            child: Text("Ver mais",style: TextStyle(color: Colors.white,fontSize: 16),),
                          )
                        )
                      ],
                    ),
                    const Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: usuarioContext.registros.length < 3 ? usuarioContext.registros.length : 3, // Limite para 3
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12), // Arredondamento aplicado
                              child: Container(
                                decoration: BoxDecoration(
                                  color: usuarioContext.registros[index].tipo == "Ganho"
                                      ? Color.fromARGB(255, 1, 92, 29)
                                      : Color.fromARGB(255, 99, 3, 3),
                                  borderRadius: BorderRadius.circular(12), // Arredonda o container
                                ),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                                              .format(usuarioContext.registros[index].quantia),
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(usuarioContext.registros[index].dataRegistro!),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "${usuarioContext.registros[index].categoria}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
