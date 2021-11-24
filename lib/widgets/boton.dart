import 'package:flutter/material.dart';
class Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 350,
    height: 60,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, 'acceso_correcto');
        },
        child: Text('Entrar',
            style: TextStyle(fontSize: 20, color: Colors.blue.shade900)
        )
    ),
    );
  }
}