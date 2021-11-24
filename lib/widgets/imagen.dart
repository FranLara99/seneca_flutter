import 'package:flutter/material.dart';
class AgregarImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/icono_andalucia.png'),
          color: Colors.white,
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Junta de Andalucía',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text('Consejería de Educación y Deporte',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ]),
        ),
      ],
    ),
  );
  }
}