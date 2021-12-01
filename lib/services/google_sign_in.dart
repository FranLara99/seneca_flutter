import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seneca_flutter/provider/google_provider_response.dart';
import 'package:seneca_flutter/services/firebase_service.dart';

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  bool emailCorrecto = false;  

  @override
  Widget build(BuildContext context) {
    
    final resultsGoogleProvider = Provider.of<GoogleProviderResponse>(context);
    Size size = MediaQuery.of(context).size;

    return !isLoading
        ? Container(
            margin: EdgeInsets.only(top: 15),
            width: size.width * 0.85,
            height: 55,
            child: OutlinedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = new FirebaseService();
                try {
                  await service.signInWithGoogle();
                  User? user = FirebaseAuth.instance.currentUser;
                  for(int i = 0; i < resultsGoogleProvider.listaGoogleLoginResponse.length; i++ )
                  {
                    print('kk1');
                    print(resultsGoogleProvider.listaGoogleLoginResponse[i].correo);
                    if(user!.email == resultsGoogleProvider.listaGoogleLoginResponse[i].correo)
                    {
                      print('Primer if');
                      emailCorrecto = true;
                    }
                  }

                  if(emailCorrecto)
                  {
                    print('Correcto');
                    Navigator.pushNamed(context, 'acceso_correcto');
                  }

                  else
                  {
                    print('Sesion cerrada');
                    await service.signOutFromGoogle();
                    _mostrarAlertaVacia(context);
                  }
                  
                } catch (e) {
                  if (e is FirebaseAuthException) {
                    print(e.message!);
                  }
                  if (e is PlatformException) {
                    print("No se ha seleccionado usuario");
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: Text(
                "Accede a tu cuenta de Google",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : Container(
            margin: EdgeInsets.all(15), child: CircularProgressIndicator());
  }
}

void _mostrarAlertaVacia(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('¡Error!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('No tienes acceso'),
              Icon(Icons.block, size: 100.0)
            ],
          ),

          actions: <Widget>[
            TextButton(
              child:Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),

            ),
            TextButton(
              child:Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
          ]
        );
      },
    );
  }