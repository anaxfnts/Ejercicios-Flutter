import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio Contenedor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 127, 212)),
        useMaterial3: true,
      ),
      home: const ClaseFoto(titulo: 'Ejercicio Contenedor'),
    );
  }
}

class ClaseFoto extends StatelessWidget {
  const ClaseFoto({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/ysya.jpeg'),
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Ysy A Bebaaaa',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
