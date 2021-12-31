// @dart=2.9

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tela_login_1/padrao_cores.dart';

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
      body: Container(
        child: Center(
          child: SplashScreen(
            seconds: 5,
            styleTextUnderTheLoader: TextStyle(),
            loadingText: Text("Login...",style: TextStyle(color: PadraoCores.gradiente1),),

            navigateAfterSeconds: LoginPage(),
            backgroundColor: PadraoCores.splascreen,


            loaderColor: PadraoCores.gradiente1



          ),
        ),
      ),
    );
  }
}
