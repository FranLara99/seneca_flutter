import 'package:flutter/material.dart';

class Gradiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff005499), Color(0xff003664)],
              stops: [0.2, 0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
    ],
  );
  }
}