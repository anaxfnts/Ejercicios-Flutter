import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Columnas y Filas Anidadas'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinea las columnas al centro
            children: [
              // Primera fila con 1 foto y texto
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Alinea la fila al centro
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito1.jpg')),
                      ),
                      Text('Gatito 1'),
                    ],
                  ),
                ],
              ),
              // Segunda fila con 2 fotos y texto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito2.jpg')),
                      ),
                      Text('Gatito 2'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito3.jpg')),
                      ),
                      Text('Gatito 3'),
                    ],
                  ),
                ],
              ),
              // Tercera fila con 3 fotos y texto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito4.jpg')),
                      ),
                      Text('Gatito 4'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito5.jpg')),
                      ),
                      Text('Gatito 5'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/gatito6.jpg')),
                      ),
                      Text('Gatito 6'),
                    ],
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
