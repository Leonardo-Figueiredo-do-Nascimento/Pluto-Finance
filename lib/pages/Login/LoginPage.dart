import 'package:flutter/material.dart';
import 'package:pluto_finance/pages/SignIn/SignInPage.dart';
import 'package:pluto_finance/pages/SignUp/SignUpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignInPage()));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.black, 
                foregroundColor: Colors.white, 
              ),
              child: Text("Entrar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignUpPage()));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white, 
              ),
              child: Text("Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
