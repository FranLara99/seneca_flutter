import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_flutter/models/login_response.dart';
import 'package:seneca_flutter/provider/provider_response.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool mostrarPass = true;
  String mostrarUsuario = "";
  String mostrarPassword = "";

  @override
  Widget build(BuildContext context) {
    //Esto contiene el json de la clase provider, usuario y contraseña de excel
    final resultsProvider = Provider.of<ProviderResponse>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
          ),
          onChanged: (valor) {
            setState(() {
              mostrarUsuario = valor;
            });
          } ,
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
                  onChanged: (valor){
                    setState(() {
                      mostrarPassword = valor;
                    });
                  },
            obscureText: mostrarPass,
      ),
        ),
        SizedBox(height: 20),
      Boton(listaCredenciales: resultsProvider.listaLoginResponse, usuario: mostrarUsuario, pass: mostrarPassword),
      ],
      
    );
  }
}

class Boton extends StatelessWidget {
final List<Result> listaCredenciales;
  final String usuario;
  final String pass;
  const Boton(
      {Key? key,
      required this.listaCredenciales,
      required this.usuario,
      required this.pass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
            if (_comprobarCredenciales(listaCredenciales, usuario, pass))
              Navigator.pushNamed(context, "acceso_correcto");
        },
        child: Text(
          "Entrar",
          style: TextStyle(color: Colors.blueAccent, fontSize: 20),
        ),
      ),
    );
  }

  bool _comprobarCredenciales(
      List<Result> listaCredenciales, String usuario, String pass) {
    bool credencialesCorrectas = false;

    print('aaaaaa'+usuario.toString());
    print('bbbbbbb'+pass.toString());
    for (int i = 0; i < listaCredenciales.length; i++) {
      print(listaCredenciales[i].usuario);
      print(listaCredenciales[i].contrasena);
      print(listaCredenciales[i]);
      if (listaCredenciales[i].usuario == usuario.toString()) {
        credencialesCorrectas = true;
      }
    }

    return credencialesCorrectas;
  }
}