import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:provider/provider.dart';

class OrcamentoPage extends StatefulWidget {
  const OrcamentoPage({super.key});

  @override
  State<OrcamentoPage> createState() => _OrcamentoPageState();
}

class _OrcamentoPageState extends State<OrcamentoPage> {

  var quantiaPatrimonioController = TextEditingController(text: "");
  var mesController = TextEditingController(text: "");

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
                    Text("Definir Orçamento",style: TextStyle(color: Colors.white,fontSize: 30)),
                    Divider(),
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Orçamento do mês",style: TextStyle(color: Colors.white,fontSize: 16),),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              controller: quantiaPatrimonioController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  quantiaPatrimonioController.text = value.replaceAll(',', '.');
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'^\d+([.,]\d{0,2})?$')),
                                TextInputFormatter.withFunction((oldValue, newValue) {
                                  return newValue.copyWith(text: newValue.text.replaceAll('.', ','));
                                }),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'R\$0,00',  
                                filled: true,
                                fillColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mês do orçamento",style: TextStyle(color: Colors.white,fontSize: 16)),
                            TextField(
                              controller: mesController,
                              style: const TextStyle(color: Colors.white,fontSize: 20),
                              decoration: const InputDecoration(   
                                filled: true,
                                fillColor: Colors.black,            
                                suffixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                hintText: "mm/aaaa",
                              ),
                              onTap: () async{
                                var date = await showMonthPicker(
                                  context: context, 
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100,1,1)
                                );
                                if(date!=null){
                                  mesController.text = DateFormat("MM/yyyy").format(date);
                                }
                              }
                            )
                          ],
                        ),
                        SizedBox(height: 20,),                        
                      ],
                    ),
                    SizedBox(height: 100,),
                    TextButton(
                      onPressed: () {
                        if(quantiaPatrimonioController.text!="" && mesController.text!=""){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color.fromARGB(255, 54, 128, 44),
                              content: const Text('Deposito registrado.',style: TextStyle(fontSize: 20,color: Colors.white),),
                              duration: const Duration(seconds: 2),
                            ),
                          );
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
                        minimumSize: Size(320, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color.fromARGB(255, 54, 128, 44), 
                        foregroundColor: Colors.white, 
                      ),
                      child: Text("Registrar orçamento",style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}