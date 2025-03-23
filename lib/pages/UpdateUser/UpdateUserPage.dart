import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {

  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome",style: TextStyle(color: Colors.white,fontSize: 20)),
                    TextField(
                      style: TextStyle(color: Colors.white),
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
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("E-mail",style: TextStyle(color: Colors.white,fontSize: 20)),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'seuemail@email.com',  
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
                SizedBox(height: 17,),
                TextButton(
                  onPressed: () {

                    if(nomeController.text!="" && telefoneController.text!="" && emailController.text!="" && senhaController.text!=""){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
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
                    backgroundColor: Color.fromARGB(255, 94, 44, 128), 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text("Cadastre-se",style: TextStyle(fontSize: 16)),
                ),
                ],
            )  
          ],
        ),
      )
    );
  }
}