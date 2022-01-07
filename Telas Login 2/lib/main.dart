import 'package:flutter/material.dart';
import 'package:tela_login_2/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home:LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

