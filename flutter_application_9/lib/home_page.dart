import 'package:flutter/material.dart';
import 'package:flutter_application_9/adivina_numero_juego.dart';
import 'package:flutter_application_9/formulario.dart';
import 'package:flutter_application_9/muestra_botones.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios Flutter'),
        backgroundColor: const Color.fromARGB(255, 255, 142, 249),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Muestrario de Botones'),
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
      body: const Center(
        child: Text('Bienvenido a los ejercicios de Flutter'),
      ),
    );
  }
}
