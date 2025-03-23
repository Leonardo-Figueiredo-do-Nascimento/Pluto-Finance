import 'package:flutter/material.dart';
import 'package:pluto_finance/contexts/UsuarioContext.dart';
import 'package:pluto_finance/widgets/Drawer/UserDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UsuarioContext usuarioContext;

  @override
  void initState() {
    super.initState();
    usuarioContext = UsuarioContext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 245, 200, 0)),
      ),
      drawer: UserDrawer(),
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 340,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 190, 156, 0),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 55),
              child: Text(
                "R\$ ${usuarioContext.saldoTotal.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 26,
                  color:
                      usuarioContext.saldoTotal < 0.0
                          ? const Color.fromARGB(255, 197, 13, 0)
                          : Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: Container(
                    height: 70,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 32, 138, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_upward_sharp,size: 40,color: Colors.white),
                        Text("Registrar\nSaldo",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18, color: Colors.white),)
                      ],
                    ),
                  )),
                TextButton(
                  onPressed: () {}, 
                  child: Container(
                    height: 70,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 185, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Registrar\nDespesas",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18, color: Colors.white)),
                        Icon(Icons.arrow_downward_sharp,size: 40,color: Colors.white),
                      ],
                    ),
                  )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
