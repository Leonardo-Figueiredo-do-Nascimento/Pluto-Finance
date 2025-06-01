import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/firebase_options.dart';
import 'package:pluto_finance/pages/Login/LoginPage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioContext()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}