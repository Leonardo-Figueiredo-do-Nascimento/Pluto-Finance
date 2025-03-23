import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,iconTheme: IconThemeData(color: Colors.white),),
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text("O que é o Pluto Finance",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(height:80),
                Text(
                  "Pluto Finance é um aplicativo para administração, monitoramento e análise financeira pessoal do usuário, desenvolvido por Leonardo Figueiredo do Nascimento, cuja principal funcionalidade é fornecer insights para conscientização dos gastos e ganhos do usuário final.",
                  style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                SizedBox(height:80),
                Text("*Os dados coletados pelo aplicativo são protegidos pela LGPD e não são utilizados para pesquisas sem o consetimento do usuario.",style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}