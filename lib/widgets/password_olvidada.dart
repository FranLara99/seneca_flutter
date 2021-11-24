import 'package:flutter/material.dart';

class PasswordOlvidada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return TextButton(
    child: Text('No recuerdo mi contraseña',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white)),
    onPressed: () {},
  );
  }
}