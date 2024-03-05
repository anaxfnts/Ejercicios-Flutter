import 'package:flutter/material.dart';
import 'package:flutter_application_9/formulario.dart';
import 'package:flutter_application_9/home_page.dart';
import 'package:flutter_application_9/mejora_aspecto.dart';
import 'package:flutter_application_9/muestra_botones.dart';

class AdivinaNumeroJuego extends StatelessWidget {
  final TextEditingController _numeroController = TextEditingController();
  final String _mensaje = '';

  AdivinaNumeroJuego({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adivina el número"),
        backgroundColor: const Color.fromARGB(255, 255, 142, 249),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
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
                    builder: (contexto) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Muestrario de Botones'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (contexto) => MuestraBotones(),
                  ),
                );
              },
            ),
            ListTile(
                title: const Text('Mejora Aspecto'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MejoraAspecto(),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _crearTextFormField(_numeroController),
            const SizedBox(height: 8.0),
            Text(
              _mensaje,
              style: const TextStyle(
                  fontSize: 16.0, color: Color.fromARGB(255, 255, 142, 249)),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _comprobarNumero(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 142, 249),
              ),
              child: const Text('Comprobar',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _crearTextFormField(TextEditingController controlador) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, introduzca un número.';
        }
        return null;
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.exposure, color: Color.fromARGB(255, 255, 142, 249)),
        hintText: 'Número',
        labelText: 'Introduzca un número del 1 al 100',
        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 142, 249)),
        ),
      ),
      keyboardType: TextInputType.number,
      controller: controlador,
      style: const TextStyle(color: Colors.black),
      cursorColor: const Color.fromARGB(255, 255, 142, 249),
    );
  }

  void _comprobarNumero(BuildContext contexto) {
    int numeroIntroducido = int.tryParse(_numeroController.text) ?? 0;
    int numeroAdivinar = 42; // Número aleatorio

    if (numeroIntroducido < numeroAdivinar) {
      _actualizarMensaje('El número es mayor. ¡Inténtalo de nuevo!', contexto);
    } else if (numeroIntroducido > numeroAdivinar) {
      _actualizarMensaje('El número es menor. ¡Inténtalo de nuevo!', contexto);
    } else {
      _actualizarMensaje('Has adivinado el número $numeroAdivinar.', contexto);
    }
  }

  void _actualizarMensaje(String mensaje, BuildContext contexto) {
    ScaffoldMessenger.of(contexto).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
