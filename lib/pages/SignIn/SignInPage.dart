import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool senhaVisivel = true;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 2,child: Text("Entre em sua conta",style: TextStyle(color: Colors.white,fontSize: 34, fontWeight: FontWeight.w700))),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("E-mail",style: TextStyle(color: Colors.white,fontSize: 20)),
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
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Senha",style: TextStyle(color: Colors.white,fontSize: 20)),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: senhaController,
                        obscureText: senhaVisivel,
                        decoration: InputDecoration(
                          hintText: 'Sua senha', 
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off , color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                senhaVisivel = !senhaVisivel;
                            });
                          },),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (_) => SignInPage()))}, 
                        child: Text("Esqueceu a senha?",style: TextStyle(color: Color.fromARGB(255, 251, 125, 255), fontSize: 16))
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Color.fromARGB(255, 0, 99, 180), 
                          foregroundColor: Colors.white, 
                        ),
                        child: Text("Entrar",style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}