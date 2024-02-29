import 'package:flutter/material.dart';
import 'package:flutter_application_9/adivina_numero_juego.dart';
import 'package:flutter_application_9/formulario.dart';
import 'package:flutter_application_9/home_page.dart';

class MuestraBotones extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {
      'title': 'Tercer Botón',
      'widget': ElevatedButton(onPressed: () {}, child: const Text('Presiona'))
    },
    {
      'title': 'Segundo Botón',
      'widget': TextButton(onPressed: () {}, child: const Text('Presiona'))
    },
    {
      'title': 'Tercer Botón',
      'widget': OutlinedButton(onPressed: () {}, child: const Text('Presiona'))
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestrario de Botones'),
        backgroundColor: const Color.fromARGB(255, 255, 142, 249),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Muestrario Botones'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MuestraBotones(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Adivina el Número'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdivinaNumeroJuego(),
                  ),
                );
              },
            ),

             ListTile(
              title: const Text('Formulario Nombre'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Formulario(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttons[index]['title']),
                  const SizedBox(height: 8.0),
                  buttons[index]['widget'],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
