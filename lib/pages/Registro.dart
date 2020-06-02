import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomovil/main.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController idusuariocontroller = new TextEditingController();
  TextEditingController nombrecontroller = new TextEditingController();
  TextEditingController apellidocontroller = new TextEditingController();
  TextEditingController correocontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();


  void registrar() {
    var url = "http://192.168.0.12/veterinaria/registro.php";

    http.post(url, body: {
      "idusuarios" : idusuariocontroller.text,
      "nombre": nombrecontroller.text,
      "apellido": apellidocontroller.text,
      "correo" : correocontroller.text,
      "pass" : passcontroller.text
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text('Registro Usuarios',
          style: TextStyle(
            color: Colors.white
          ),),
        backgroundColor: Colors.green
      ),
      body: Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: idusuariocontroller,
                    decoration: new InputDecoration(
                      hintText: "Numero de Identificacion", labelText: "Numero de Identificacion:",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.people, color: Colors.black),
                  title: new TextFormField(
                    controller: nombrecontroller,
                    decoration: new InputDecoration(
                      hintText: "Nombre", labelText: "Nombre:",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.people, color: Colors.black),
                  title: new TextFormField(
                    controller: apellidocontroller,
                    decoration: new InputDecoration(
                      hintText: "Apellido", labelText: "Apellido:",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.email, color: Colors.black),
                  title: new TextFormField(
                    controller: correocontroller,
                    decoration: new InputDecoration(
                      hintText: "Correo/Email", labelText: "Email:",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.priority_high, color: Colors.black),
                  title: new TextFormField(
                    controller: passcontroller,
                    decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password:",
                    ),
                  ),
                ),

                new Padding(
                  padding: const EdgeInsets.all(30.0),
                ),
                new RaisedButton(
                  child: new Text("Registrarse"),
                  color: Colors.blueAccent,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                      registrar();
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=> new LoginPage(),
                          ));

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}
