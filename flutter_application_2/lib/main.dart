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
          title: Text('Manejo de Desbordamiento de Texto'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Utilizando Expanded para manejar el desbordamiento
                Expanded(
                  child: Text(
                    'Este es un texto largo que desbordará el tamaño del campo de texto y necesitamos manejar este desbordamiento.',
                    style: TextStyle(
                      fontFamily: 'TaylorGothic', // Usa el nombre de la fuente definida en pubspec.yaml
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Utilizando Expanded para manejar el desbordamiento
                Expanded(
                  child: Text(
                    'Este es otro texto largo que desbordará el tamaño del campo de texto y estamos utilizando Expanded para manejar este desbordamiento.',
                    style: TextStyle(
                      fontFamily: 'TaylorGothic',
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
