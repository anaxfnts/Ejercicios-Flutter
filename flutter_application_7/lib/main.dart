import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Contenido de la aplicación'),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Ana'),
            accountEmail: Text('anar27fp@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/paisaje.jpg'),
            ),
          ),
          ListTile(
            title: const Text('Ajustes'),
            onTap: () {
              // Acción cuando se seleccione "Ajustes"
            },
          ),
          ListTile(
            title: const Text('Juegos'),
            onTap: () {
              // Acción cuando se seleccione "Juegos"
            },
          ),
          ListTile(
            title: const Text('Notas'),
            onTap: () {
              // Acción cuando se seleccione "Notas"
            },
          ),
          ListTile(
            title: const Text('Foto'),
            onTap: () {
              // Acción cuando se seleccione "Foto"
            },
          ),
          ListTile(
            title: const Text('Salir'),
            onTap: () {
              // Acción cuando se seleccione "Salir"
            },
          ),
        ],
      ),
    );
  }
}
