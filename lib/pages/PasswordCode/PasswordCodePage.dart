import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_finance/pages/Home/HomePage.dart';

class PasswordCodePage extends StatefulWidget {
  const PasswordCodePage({super.key});

  @override
  State<PasswordCodePage> createState() => _PasswordCodePageState();
}

class _PasswordCodePageState extends State<PasswordCodePage> {
  var codigoController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    codigoController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      isButtonEnabled = codigoController.text.length >= 5; 
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informe o código enviado por e-mail:",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      style: TextStyle(color: Colors.white, fontSize: 28),
                      keyboardType: TextInputType.number,
                      controller: codigoController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        }
                      : null, 
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: isButtonEnabled
                        ? const Color.fromARGB(255, 29, 126, 0)
                        : Colors.grey, 
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Próximo", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}