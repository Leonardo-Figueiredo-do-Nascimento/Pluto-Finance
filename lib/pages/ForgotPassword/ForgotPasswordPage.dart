import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:pluto_finance/pages/PasswordCode/PasswordCodePage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  var emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
                    Text("Informe o E-mail pra retornar a senha:",style: TextStyle(color: Colors.white,fontSize: 18)),
                    SizedBox(height: 10,),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'seuemail@email.com',  
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ],
                ),       
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if(emailController.text!='') {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PasswordCodePage()));
                    }else{
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("Insira um email pra verificação",style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color.fromARGB(255, 4, 0, 255), 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text("Proximo",style: TextStyle(fontSize: 24)),
                ),        
              ],
            ),
          ],
        ),
      ),
    );
  }
}