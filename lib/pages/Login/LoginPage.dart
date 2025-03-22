import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/SignIn/SignInPage.dart';
import 'package:pluto_finance/pages/SignUp/SignUpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 55, 55),
      body: Center(
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
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => SignInPage()));
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
                    Navigator.pushReplacement(
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
