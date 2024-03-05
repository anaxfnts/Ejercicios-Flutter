import 'package:flutter/material.dart';
import 'package:flutter_application_9/adivina_numero_juego.dart';
import 'dart:math';
import 'dart:async';

import 'package:flutter_application_9/formulario.dart';
import 'package:flutter_application_9/muestra_botones.dart';

class MejoraAspecto extends StatefulWidget {
  const MejoraAspecto({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MejoraAspectoState createState() => _MejoraAspectoState();
}

class _MejoraAspectoState extends State<MejoraAspecto>
    with SingleTickerProviderStateMixin {
  int puntos = 0;
  late String randomName;
  late Color randomColor;
  bool hasScored = false;
  bool showKittenImage = false; // Nuevo booleano para controlar la visualización de la imagen del gatito1

  late AnimationController _animationController;
  late Animation<double> _animation;

  var colorNames = [
    'Azul',
    'Verde',
    'Naranja',
    'Rosa',
    'Rojo',
    'Morado',
    'Amarillo'
  ];
  var colores = [
    const Color(0xFF0000FF),
    const Color(0xFF00FF00),
    const Color(0xFFFF914D),
    const Color(0xFFFF66C4),
    const Color(0xFFFF0000),
    const Color(0xFF800080),
    const Color(0xFFFBC512)
  ];

  @override
  void initState() {
    super.initState();
    getColor();
    getNombre();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    timer();
  }

  void timer() {
    Timer.periodic(Duration(milliseconds: establecerDuracion()), (timer) {
      getColor();
      getNombre();
      hasScored = false;

      if (puntos > 0 && puntos % 5 == 0) {
        int speedMultiplier = (puntos ~/ 5) + 1;
        _animationController.duration = Duration(seconds: 2 ~/ speedMultiplier);
      } else {
        _animationController.duration = const Duration(seconds: 2);
      }

      setState(() {});
    });
  }

  int establecerDuracion() {
    // Calcular la duración del temporizador en base a la puntuación actual
    return 3000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mejora Aspecto ej. 10'),
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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Pulsa en el cuadrado cuando el nombre y el color coincidan\npara revelar la imagen:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          if (showKittenImage) // Mostrar la imagen del gatito1 solo si showKittenImage es verdadero
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Image.asset(
                    'assets/gatito1.jpg',
                    width: 120,
                    height: 120,
                  ),
                );
              },
            ),
          Text(
            'Puntos: $puntos',
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                onGiftTap(randomName, randomColor);
              },
              child: Column(
                children: [
                  Container(
                    width: 120,
                    color: randomColor,
                    height: 120,
                    child: hasScored
                        ? const Text(' ')
                        : const SizedBox(),
                  ),
                  Text(
                    randomName,
                    style: TextStyle(
                      color: randomColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getColor() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    randomColor = colores[randomNumber];
  }

  void getNombre() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    randomName = colorNames[randomNumber];
  }

  String hexToStringConverter(Color hexColor) {
    if (hexColor == const Color(0xFF0000FF)) {
      return 'Azul';
    } else if (hexColor == const Color(0xFF00FF00)) {
      return 'Verde';
    } else if (hexColor == const Color(0xFFFF914D)) {
      return 'Naranja';
    } else if (hexColor == const Color(0xFFFF66C4)) {
      return 'Rosa';
    } else if (hexColor == const Color(0xFFFF0000)) {
      return 'Rojo';
    } else if (hexColor == const Color(0xFF800080)) {
      return 'Morado';
    } else {
      return 'Amarillo';
    }
  }

  void onGiftTap(String name, Color color) {
    if (!hasScored) {
      var colorToString = hexToStringConverter(color);

      if (name == colorToString) {
        puntos++;
        hasScored = true;
        showKittenImage = true; // Establecer showKittenImage a verdadero cuando el usuario acierta el color
        _animationController.reset();
        _animationController.forward();
      } else {
        puntos--;
      }

      setState(() {});
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
