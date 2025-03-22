import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/ForgotPassword/ForgotPasswordPage.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';
import 'package:pluto_finance/pages/SignUp/SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool senhaVisivel = true;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 55, 55),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 3.14 / 4, // Rotaciona 45 graus
              child: Image.asset(
                'assets/images/pluto-bidente.png',
                width: 200,
                height: 200,
              ),
            ),
            Column(
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
                  SizedBox(height: 10,),
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
                              }
                            );
                          },
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordPage()))}, 
                        child: Text("Esqueceu a senha?",style: TextStyle(color: Color.fromARGB(255, 251, 125, 255), fontSize: 16))
                      ),
                    ],
                  ),
              ],
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.black, 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text("Entrar",style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color.fromARGB(255, 94, 44, 128),
                    foregroundColor: Colors.white, 
                  ),
                  child: Text("Cadastre-se",style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
