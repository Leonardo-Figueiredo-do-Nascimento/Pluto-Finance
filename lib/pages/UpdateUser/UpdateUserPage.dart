import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/models/Usuario.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:pluto_finance/services/UsuarioService/UsuarioService.dart';
import 'package:provider/provider.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {

  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
  bool senhaVisivel = true;
  bool habiilitarEdicao = false;
  final usuarioService = UsuarioService();

  @override
  Widget build(BuildContext context) {

    final usuarioContext = context.watch<UsuarioContext>();
    
    nomeController.text = usuarioContext.nome!;
    telefoneController.text = usuarioContext.telefone!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black, 
      ),
      backgroundColor: Color.fromARGB(255, 56, 55, 55),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome",style: TextStyle(color: Colors.white,fontSize: 20)),
                    TextField(
                      enabled: habiilitarEdicao,
                      style: TextStyle(color: habiilitarEdicao ? Colors.white : const Color.fromARGB(123, 255, 255, 255)),
                      controller: nomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome completo',  
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Telefone",style: TextStyle(color: Colors.white,fontSize: 20)),
                    TextField(
                      enabled: habiilitarEdicao,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: habiilitarEdicao ? Colors.white : const Color.fromARGB(123, 255, 255, 255)),
                      controller: telefoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '16999999999',  
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    habiilitarEdicao ? TextButton(
                      onPressed: () async {
                        if(nomeController.text!="" && telefoneController.text!=""){
                          Usuario user = usuarioContext.getUsuario();

                          user.nome = nomeController.text;
                          user.telefone = telefoneController.text;
                          
                          usuarioService.atualizarUsuario(user);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepPurple.shade700,
                              content: const Text('Dados atualizados.',style: TextStyle(fontSize: 20,color: Colors.white),),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                        }else{
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text("Preencha os campos corretamente",style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Fecha o alerta
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color.fromARGB(255, 54, 128, 44), 
                        foregroundColor: Colors.white, 
                      ),
                      child: Text("Confirmar",style: TextStyle(fontSize: 16)),
                    )
                    : TextButton(
                      onPressed: () {
                        setState(() {
                          habiilitarEdicao = !habiilitarEdicao;
                        });
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color.fromARGB(255, 94, 44, 128), 
                        foregroundColor: Colors.white, 
                      ),
                      child: Text("Editar",style: TextStyle(fontSize: 16)),
                    ) 
                  ],
                ),
                ],
            )  
          ],
        ),
      )
    );
  }
}