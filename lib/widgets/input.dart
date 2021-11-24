import 'package:flutter/material.dart';
class CrearInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 350,
    child: TextField(
        //controller: usuario,
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff195d94),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white)),
          hintText: 'Usuario',
        )),
  );
  }
}