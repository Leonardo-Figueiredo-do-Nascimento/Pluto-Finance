import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/pages/Login/LoginPage.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>UsuarioContext())
    ],
      child: const LoginPage()
    )
  );
}