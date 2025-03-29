import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/models/Registro.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:provider/provider.dart';

class RegistrarGanhosPage extends StatefulWidget {
  const RegistrarGanhosPage({super.key});

  @override
  State<RegistrarGanhosPage> createState() => _RegistrarGanhosPageState();
}

class _RegistrarGanhosPageState extends State<RegistrarGanhosPage> {
  
  var quantiaController = TextEditingController(text: "");
  var dataController = TextEditingController(text: "");
  String? selectedCategoria;
  List<String> categoriasLst = ["Salário","Dividendos","Venda","Empréstimo","Outros"];

  @override
  void initState(){
    super.initState();
    dataController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {

    final usuarioContext = context.read<UsuarioContext>();

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
                Text("DEPOSITO",style: TextStyle(color: Colors.white,fontSize: 30)),
                SizedBox(height: 80,),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Insira a quantia:",style: TextStyle(color: Colors.white,fontSize: 20)),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: quantiaController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              quantiaController.text = value.replaceAll(',', '.');
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
                    SizedBox(height: 17,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selecione a Categoria do Deposito:",style: TextStyle(color: Colors.white,fontSize: 20)),
                        
                        Container(
                          width: 350,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),                        
                          ),
                          child: DropdownButton2(
                            hint: Text("Selecione uma opção", style: TextStyle(color: const Color.fromARGB(88, 255, 255, 255))),
                            value: selectedCategoria,
                            dropdownStyleData: DropdownStyleData(
                              width: 330,
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color.fromARGB(255, 1, 0, 65),
                              ),
                              offset: const Offset(0, 8),
                            ),
                            isExpanded: true, 
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategoria = newValue;
                              });
                            },
                            items: categoriasLst.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Data do Depósito:",style: TextStyle(color: Colors.white,fontSize: 20)),
                        TextField(
                          controller: dataController,
                          style: const TextStyle(color: Colors.white,fontSize: 20),
                          decoration: const InputDecoration(   
                            filled: true,
                            fillColor: Colors.black,            
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            hintText: "dd/mm/aaaa",
                          ),
                          onTap: () async{
                            var date = await showDatePicker(
                              context: context, 
                              firstDate: DateTime(2010,1,1),
                              lastDate: DateTime(2100,1,1)
                            );
                            if(date!=null){
                              dataController.text = DateFormat("dd/MM/yyyy").format(date);
                            }
                          }
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 120,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if(quantiaController.text!="" && selectedCategoria!=null && dataController.text!=""){
                          Registro registro = new Registro();
                          registro.registroId = usuarioContext.usuarioId;
                          registro.quantia = double.parse(quantiaController.text);
                          registro.categoria = selectedCategoria;
                          registro.tipo = "Ganho";
                          registro.dataRegistro = DateFormat("dd/MM/yyyy").parse(dataController.text);
                          usuarioContext.adicionarRegistro(registro);
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
                        minimumSize: Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color.fromARGB(255, 54, 128, 44), 
                        foregroundColor: Colors.white, 
                      ),
                      child: Text("Confirmar",style: TextStyle(fontSize: 16)),
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