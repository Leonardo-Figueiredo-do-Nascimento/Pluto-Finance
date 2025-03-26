import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:provider/provider.dart';

class RegistrosPage extends StatefulWidget {
  const RegistrosPage({super.key});

  @override
  State<RegistrosPage> createState() => _RegistrosPageState();
}

class _RegistrosPageState extends State<RegistrosPage> {

  @override
  Widget build(BuildContext context) {

    final usuarioContext = context.read<UsuarioContext>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 245, 200, 0)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Substitui a tela atual pela nova tela usando pushReplacement
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Substitua 'NovaTela' pela sua tela de destino
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
                    Text("Últimos Registros",style: TextStyle(color: Colors.white,fontSize: 30)),
                    Divider()
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: usuarioContext.registros.length, 
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
                                  Text(
                                    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                                        .format(usuarioContext.registros[index].quantia),
                                    style: const TextStyle(color: Colors.white),
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
                              trailing: Container(
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: IconButton(
                                  icon: Icon(Icons.delete_forever, color: Colors.red,size: 35,),
                                  onPressed: () {
                                    
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Confirmar remoção'),
                                          content: Text('Você tem certeza que deseja remover este registro?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('Cancelar'),
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Fecha o dialog
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Confirmar'),
                                              onPressed: () {
                                                usuarioContext.removerRegistro(usuarioContext.registros[index]);
                                                Navigator.of(context).pop();
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (index < usuarioContext.registros.length - 1)
                          const SizedBox(height: 8), 
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}