// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Scroll',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fancy Scroll'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // ignore: prefer_const_constructors
          SliverAppBar(
            backgroundColor: Colors.amber,
            elevation: 0,
            pinned: true,
            expandedHeight: 250,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              // ignore: prefer_const_literals_to_create_immutables
              stretchModes: [StretchMode.blurBackground],
              background: Image(
                image: AssetImage('assets/igreja.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(-30.0), child: SizedBox()),
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(label: Text('Digite um texto')),
                ),
              )),

          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 20, ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.3)),
                width: 200,
                height: 70,
              ),
            );
          })))
        ],
      ),
    );
  }
}
