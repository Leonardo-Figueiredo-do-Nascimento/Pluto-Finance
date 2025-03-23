import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/About/AboutPage.dart';
import 'package:pluto_finance/pages/Login/LoginPage.dart';
import 'package:pluto_finance/pages/UpdateUser/UpdateUserPage.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 56, 55, 55),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateUserPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.person, size: 24,color: Colors.white),
                        SizedBox(width: 10,),
                        Text("Atualizar Dados", style: TextStyle(fontSize: 20,color: Colors.white),)
                      ]
                    )
                  ),
                  Divider(),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.attach_money, size: 24,color: Colors.white),
                        SizedBox(width: 10),
                        Text("Definir Orçamento", style: TextStyle(fontSize: 20,color: Colors.white),)
                      ]
                    )
                  ),
                  Divider(),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.insights, size: 24,color: Colors.white),
                        SizedBox(width: 10,),
                        Text("Analisar Carteira", style: TextStyle(fontSize: 20,color: Colors.white),)
                      ]
                    )
                  ),
                  Divider(),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.assignment, size: 24,color: Colors.white),
                        SizedBox(width: 10,),
                        Text("Consultar Registros", style: TextStyle(fontSize: 20,color: Colors.white),)
                      ]
                    )
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 24,color: Colors.white),
                        SizedBox(width: 10,),
                        Text("Sobre", style: TextStyle(fontSize: 20,color: Colors.white)),
                      ]
                    )
                  ),
                  Divider(),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                    }, 
                    child: Row(
                      children: [
                        Icon(Icons.logout,size: 26, color: Color.fromARGB(255, 245, 52, 52),),
                        SizedBox(width: 10,),
                        Text("Sair", style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 245, 52, 52)),)
                      ]
                    )
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}