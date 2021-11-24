import 'package:flutter/material.dart';
import 'package:seneca_flutter/widgets/login.dart';
import 'package:seneca_flutter/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        backgroundColor: Colors.blue.shade900,
        body: Stack(
          children: [
            Gradiente(),
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 70),
                    Text(
                      'iSéneca',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Login(),
                    SizedBox(height: 15),
                    PasswordOlvidada(),
                    SizedBox(height: 10),
                    AgregarImagen(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('v.11.3.0',
                            style: TextStyle(color: Colors.white, fontSize: 18))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
