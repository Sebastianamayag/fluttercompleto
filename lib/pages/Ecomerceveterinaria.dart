import 'package:flutter/material.dart';

class Ecomercevet extends StatefulWidget {
  @override
  _EcomercevetState createState() => _EcomercevetState();
}

class _EcomercevetState extends State<Ecomercevet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Tienda Veterinaria'),),
      body: new Column(
        children: <Widget>[
          new Text('Estamos en la tienda de la veterinaria')
        ],
      ),
    );
  }
}
