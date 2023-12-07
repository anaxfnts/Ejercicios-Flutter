import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios Flutter'),
        backgroundColor: Color.fromARGB(255, 255, 142, 249),
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
              title: const Text('9- Muestrario de Botones'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonShowcase(),
                  ),
                );
              },
            ),
            // Puedes agregar más ListTile para otros ejercicios
          ],
        ),
      ),
      body: const Center(
        child: Text('Bienvenido a los ejercicios de Flutter'),
      ),
    );
  }
}

class ButtonShowcase extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'title': 'ElevatedButton', 'widget': ElevatedButton(onPressed: () {}, child: const Text('Press Me'))},
    {'title': 'TextButton', 'widget': TextButton(onPressed: () {}, child: const Text('Press Me'))},
    {'title': 'OutlinedButton', 'widget': OutlinedButton(onPressed: () {}, child: const Text('Press Me'))},
    // Agrega más botones según tus necesidades
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestrario de Botones'),
        backgroundColor: Color.fromARGB(255, 255, 142, 249),
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
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Muestrario de Botones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Hay que agregar más ListTitle para más ejercicios
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
