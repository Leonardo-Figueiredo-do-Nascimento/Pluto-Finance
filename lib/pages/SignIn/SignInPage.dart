import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 0, 80, 60),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E-mail",style: TextStyle(color: Colors.white)),
                TextField(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Senha",style: TextStyle(color: Colors.white)),
                TextField(),
              ],
            ),
            InkWell(onTap: () => {}, child: Text("Esqueceu a senha?",style: TextStyle(color: Colors.purpleAccent)))
          ],
        ),
      ),
    );
  }
}