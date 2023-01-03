import 'package:flutter/material.dart';
import 'package:navigation_drawer/HomePage.dart';
import 'package:navigation_drawer/Pagina1.dart';
import 'package:navigation_drawer/Pagina2.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
  void pagina1(BuildContext context) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Pagina1(),
      ),
    );
  }

  void pagina2(BuildContext context) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Pagina2(),
      ),
    );
  }

  void homepage(BuildContext context) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            title: const Text('Home Page'),
            leading: const Icon(Icons.menu),
            onTap: () => homepage(context),
          ),

          // ignore: prefer_const_constructors
          Divider(),
          ListTile(
            title: const Text('Pagina 1'),
            leading: const Icon(Icons.document_scanner_outlined),
            onTap: () => pagina1(context),
          ),
          ListTile(
            title: const Text('Pagina 2'),
            leading: const Icon(Icons.document_scanner_outlined),
            onTap: () => pagina2(context),
          )
        ],
      )),
    );
  }
}
