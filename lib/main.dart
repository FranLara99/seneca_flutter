import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:seneca_flutter/provider/google_provider_response.dart';
import 'package:seneca_flutter/provider/provider_response.dart';
import 'package:seneca_flutter/screens/acceso_correcto.dart';
import 'package:seneca_flutter/screens/home_screen.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
} 

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Se debe de importar provider en pubspec.yaml
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => ProviderResponse(), 
          lazy: false
          ),
          ChangeNotifierProvider(
          create: (_) => GoogleProviderResponse(),
          lazy: false,
          ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Esto es para poner lo de arriba del todo en blanco
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      //El debugSow... es para eliminar lo de debug en la pantalla
      debugShowCheckedModeBanner: false,
      title: 'Seneca',
      initialRoute: 'home_screen',
      theme: ThemeData.dark(),
      routes: {
        //Si no usamos el buildContext context, le ponemos _
        'home_screen': ( _ ) => HomeScreen(),
        'acceso_correcto': ( _ ) => AccesoCorrecto(),
      }
    );
  }
}