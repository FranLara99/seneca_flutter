import 'package:flutter/material.dart';
import 'package:seneca_flutter/services/google_sign_out.dart';

class AccesoCorrecto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          gradiente(),
          _Scroll()
        ],
      ),
      bottomNavigationBar: menuNavegacion(),
    );
  }
}

class _Scroll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            children: [
              titulo(),
              caja(),
              caja2(),
              iconos(),
              
            ],
          ),
      
    );
  }
}

Widget gradiente() {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff02569d), Color(0xffffffff)],
              stops: [0.3, 0.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
    ],
  );
}

Widget titulo() {
  return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 110, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'iSéneca',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 51),
            )
          ],
        ),
      ));
}

Widget caja() {
  return Container(
    width: 350,
    height: 100,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text('Lara Aguilar, Fran', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 140 ),
              Text('Log out', style: TextStyle(color: Colors.red, fontSize: 12)),
              SizedBox(width: 10),
              GoogleSignOut(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('I.E.S. Jándula', style: TextStyle(color: Colors.black),),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Perfil Dirección', style: TextStyle(color: Colors.black),),
        )
      ],
    ),
  );
}

Widget caja2(){
  return Container(
    width: 350,
    height: 50,
    color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 40),
        Icon(Icons.access_time),
        SizedBox(width: 10),
        Text('Avisos'),
        SizedBox(width: 50),
        VerticalDivider(
          color: Colors.white,
          width: 7,
        ),
        SizedBox(width: 10),
        Icon(Icons.ac_unit),
        SizedBox(width: 30),
        Text('Avisos'),
      ],
    ),
  );
}

Widget menuNavegacion() {
  return BottomNavigationBar(
      selectedItemColor: Colors.blue.shade900,
      //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Inicio',
          //backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Agenda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_comment_rounded),
          label: 'Comunicaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_sharp),
          label: 'Menú',
        ),
      ]);
}

Widget iconos(){
  return Container(
    margin: EdgeInsets.all(15),
    child: Table(
      border: TableBorder(
        verticalInside: BorderSide(
          width: 1.5,
          color: Colors.grey
        ),
        horizontalInside: BorderSide(
          width: 1.5,
          color: Colors.grey
        )
      ),
      children: [
        TableRow(
          children: [
            _SigleCard(
              icon: 'assets/sombrero.png', 
              color: Colors.black, 
              text: 'Alumnado del centro'
            ),
            _SigleCard(
              icon: 'assets/profesor.png', 
              color: Colors.black, 
              text: 'Personal del centro'
            ),
            _SigleCard(
              icon: 'assets/covid.png', 
              color: Colors.black, 
              text: 'Información covid'
            ),
          ],
        ),
        TableRow(
          children: [
            _SigleCard(
              icon: 'assets/campana.png', 
              color: Colors.black, 
              text: 'Tablón de anuncios'
            ),
            _SigleCard(
              icon: 'assets/calendario.png',
              color: Colors.black, 
              text: 'Calendario escolar'
            ),
              Container()
          ]
        )
      ],
      
    ),
  );
}

class _SigleCard extends StatelessWidget {
  //Variables para pasarselas al constructor

  final String icon;
  final Color color;
  final String text;

  const _SigleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              child: Image.asset(this.icon)
            ),
            SizedBox( height: 10),
            Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
      ],
    )
    );
  }
}
