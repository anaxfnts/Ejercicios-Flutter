import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ejemplo de transform',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Ejemplo de Transform'),
          ),
        ),
        body: Row(
          children: <Widget>[
            Contenedor(Color.fromARGB(255, 188, 42, 255), 120.0, 120.0, 'morado', padding: EdgeInsets.all(8.0), alignment: Alignment.center),
            Contenedor(Color.fromARGB(255, 59, 255, 147), 100.0, 100.0, 'verde', padding: EdgeInsets.symmetric(vertical: 16.0), alignment: Alignment.bottomCenter),
            Contenedor(Color.fromARGB(255, 255, 193, 59), 110.0, 110.0, 'naranja', padding: EdgeInsets.only(left: 12.0, right: 8.0), alignment: Alignment.topRight),
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
      transform: Matrix4.rotationZ(0.5), // 0.5 son radianes
      child: Center(
        child: Text(this.texto),
      ),
    );
  }
}
