import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ejemplo de iconos',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Ejemplo de Iconos'),
          ),
        ),
        body: Row(
          children: <Widget>[
            Contenedor(Color.fromRGBO(141, 41, 255, 1), 120.0, 120.0, 'morado', padding: EdgeInsets.all(8.0), alignment: Alignment.center),
            Contenedor(Color.fromARGB(255, 255, 83, 232), 100.0, 100.0, 'rosa', padding: EdgeInsets.symmetric(vertical: 16.0), alignment: Alignment.bottomCenter),
            Contenedor(Color.fromARGB(255, 255, 37, 37), 110.0, 110.0, 'rojo', padding: EdgeInsets.only(left: 12.0, right: 8.0), alignment: Alignment.topRight),
          ],
        ),
      ),
    );
  }
}

class Contenedor extends StatelessWidget {
  final color;
  final alto;
  final ancho;
  final texto;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  Contenedor(this.color, this.alto, this.ancho, this.texto, {this.padding, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      width: this.ancho,
      height: this.alto,
      padding: this.padding,
      alignment: this.alignment,
      child: Center(
        child: Text(this.texto),
      ),
    );
  }
}
