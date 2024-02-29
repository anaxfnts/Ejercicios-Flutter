import 'package:flutter/material.dart';
import 'package:flutter_application_9/adivina_numero_juego.dart';
import 'package:flutter_application_9/home_page.dart';
import 'package:flutter_application_9/muestra_botones.dart';

class Usuario {
  final String nombre;
  final int edad;

  Usuario(this.nombre, this.edad);
}

class Formulario extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        backgroundColor: const Color.fromARGB(255, 255, 142, 249), // Color de la AppBar
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _edadController,
              decoration: const InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _enviarFormulario(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 142, 249), // Color del botón
              ),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  void _enviarFormulario(BuildContext context) {
    String nombre = _nombreController.text;
    String edad = _edadController.text;

    if (nombre.isNotEmpty && edad.isNotEmpty) {
      int edadInt = int.tryParse(edad) ?? -1;

      if (edadInt > 0) {
        // Valida los datos
        _mostrarUsuario(context, Usuario(nombre, edadInt));
      } else {
        _mostrarMensaje(context, 'La edad debe ser un número mayor que cero.');
      }
    } else {
      _mostrarMensaje(context, 'Por favor, completa todos los campos.');
    }
  }

  void _mostrarUsuario(BuildContext context, Usuario usuario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información del usuario'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nombre: ${usuario.nombre}'),
              const SizedBox(height: 8.0),
              Text('Edad: ${usuario.edad}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

