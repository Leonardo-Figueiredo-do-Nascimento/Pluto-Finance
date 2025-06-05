import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_finance/contexts/LoginContext.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:pluto_finance/services/Authentication/FirebaseAuthentication.dart';
import 'package:provider/provider.dart';

class PasswordCodePage extends StatefulWidget {
  const PasswordCodePage({super.key});

  @override
  State<PasswordCodePage> createState() => _PasswordCodePageState();
}

class _PasswordCodePageState extends State<PasswordCodePage> {
  var codigoController = TextEditingController();
  bool isButtonEnabled = false;

  final firebaseAuthentication = FirebaseAuthentication();

  @override
  void initState() {
    super.initState();
    codigoController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      isButtonEnabled = codigoController.text.length >= 5; 
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginContext>(context);
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informe a senha enviada por e-mail:",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      style: TextStyle(color: Colors.white, fontSize: 28),
                      keyboardType: TextInputType.number,
                      controller: codigoController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: isButtonEnabled
                      ? () async {
                          print(provider.email);
                          String? error = await firebaseAuthentication.login(provider.email, codigoController.text);
                          if (error != null) {
                            showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text("Erro ao fazer login: ${error}",style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                          }
                        }
                      : null, 
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: isButtonEnabled
                        ? const Color.fromARGB(255, 29, 126, 0)
                        : Colors.grey, 
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Próximo", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}