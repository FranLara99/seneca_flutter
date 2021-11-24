import 'package:flutter/material.dart';

class CrearPassword extends StatefulWidget {
  @override
  State<CrearPassword> createState() => _CrearPasswordState();
}

class _CrearPasswordState extends State<CrearPassword> {
bool mostrarPass = true;

String usuario = "";

String pass = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextField(
          //controller: password,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff195d94),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Contraseña',
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                      mostrarPass = !mostrarPass;
                }),
                icon: Icon(Icons.remove_red_eye_outlined,color: Colors.white))),
          obscureText: mostrarPass,
      )
  );
}
}