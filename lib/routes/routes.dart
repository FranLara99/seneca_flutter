import 'package:flutter/material.dart';
import 'package:seneca_flutter/screens/acceso_correcto.dart';
import 'package:seneca_flutter/screens/home_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return {
    '/': (BuildContext context) => HomeScreen(),
    'acceso' : (BuildContext context) => AccesoCorrecto(),
  };
}