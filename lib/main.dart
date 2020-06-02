import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomovil/pages/Ecomerceveterinaria.dart';
import 'package:proyectomovil/pages/Registro.dart';

void main() => runApp(LoginApp());

String usuario;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Movil',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/Ecomerceveterinaria': (BuildContext context) => new Ecomercevet(),
        '/Registro': (BuildContext context) => new Registro(),
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController correocontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  String mensaje = '';
  Future<List> login() async {
    final response =
        await http.post("http://192.168.0.12/veterinaria/login.php", body: {
      "correo": correocontroller.text,
      "pass": passcontroller.text,
    });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      mensaje = "Correo o password incorrectos";
    } else {
      mensaje = "Login";
      Navigator.pushReplacementNamed(context, '/Ecomerceveterinaria');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print('altura: ${size.height}, ancho: ${size.width}');
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            height: size.height,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/digital.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: size.height > 600 ? 77 : 30),
                  child: new CircleAvatar(
                    backgroundColor: Color(0xF81F7F3),
                    child: new Image(
                      width: size.height > 600 ? 135 : 90,
                      height: size.height > 600 ? 135 : 90,
                      image: new AssetImage("assets/images/avatar7.png"),
                    ),
                  ),
                  width: size.height > 600 ? 170.0 : 130,
                  height: size.height > 600 ? 170.0 : 130,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
                Container(
                  height:
                      size.height > 600 ? size.height / 2 : size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: size.height > 600 ? 93 : 33,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        padding: EdgeInsets.only(
                            top: size.height > 600 ? 4 : 2,
                            left: 16,
                            right: 16,
                            bottom: size.height > 600 ? 4 : 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: correocontroller,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Correo'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: size.height > 600 ? 4 : 2,
                            left: 16,
                            right: 16,
                            bottom: size.height > 600 ? 4 : 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: passcontroller,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              hintText: 'Password'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                            right: 32,
                          ),
                          child: Text(
                            "Recordar Password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Spacer(),
                      new RaisedButton(
                        child: new Text(" Ingresar"),
                        color: Colors.orangeAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          login();
                        },
                      ),
                      Spacer(),
                      new RaisedButton(
                        child: new Text("Registrarse"),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/Registro');
                        },
                      ),
                      Text(
                        mensaje,
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
