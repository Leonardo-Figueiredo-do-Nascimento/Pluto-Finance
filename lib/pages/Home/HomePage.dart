import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/widgets/Drawer/UserDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UsuarioContext usuarioContext;

  @override
  void initState() {
    super.initState();
    usuarioContext = UsuarioContext();
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 55),
                  child: Text(
                    "R\$ ${usuarioContext.saldoTotal.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 26,
                      color: usuarioContext.saldoTotal < 0.0
                          ? const Color.fromARGB(255, 197, 13, 0)
                          : Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {}, 
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
                        onPressed: () {}, 
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
                    const Text(
                      "Últimos Registros",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Divider(),
                    // Adicione uma lista para simular os registros
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10, // Simulação de 10 registros
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Registro ${index + 1}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: const Text(
                            "Descrição do registro",
                            style: TextStyle(color: Colors.grey),
                          ),
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
