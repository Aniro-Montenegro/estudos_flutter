// @dart=2.9

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'LoginPage.dart';


void main() {
  runApp(


      new MaterialApp(


        title: "Login",
        theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Color.fromARGB(255, 80, 183, 72),
            errorColor: Colors.white),
        debugShowCheckedModeBanner: false,



        initialRoute: '/',
        routes: {
          '/':(context)=> MyApp(),

        },
      )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SplashScreen(
        seconds: 5,
        styleTextUnderTheLoader: TextStyle(),
        loadingText: Text("Login...",style: TextStyle(color: Colors.white),),

        navigateAfterSeconds: LoginPage(),
        backgroundColor: Color.fromARGB(255, 80, 184, 72),


        loaderColor: Color.fromARGB(255, 214, 224, 64),



      ),
    );
  }
}
