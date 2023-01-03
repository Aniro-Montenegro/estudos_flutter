// ignore_for_file: prefer_const_constructors

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
      title: 'Animated Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Button'),
    );
  }
}

enum ButtonState { init, loading, done }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonState state = ButtonState.init;
  bool isloadingP = false;
  bool isStredched = false;
  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    bool isDone = state == ButtonState.done;

    bool isStredched = isAnimating || state == ButtonState.init;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size.fromHeight(72),
                      shape: const StadiumBorder()),
                  onPressed: () {
                    setState(() {
                      isloadingP = true;
                    });
                    Future.delayed(Duration(seconds: 3)).then(
                      (value) {
                        setState(() {
                          isloadingP = !isloadingP;
                        });
                      },
                    );
                  },
                  child: isLoading(isloadingP)),
            ),
            AnimatedContainer(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              width: state == ButtonState.init
                  ? MediaQuery.of(context).size.width
                  : 150,
              height: 70,
              onEnd: (() => setState(() {
                    isAnimating = !isAnimating;
                  })),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: isStredched ? buildButton() : buildSmallButton(isDone),
            ),
          ],
        ));
  }

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.teal : Colors.indigo;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ? Icon(
                Icons.done,
                color: Colors.white,
                size: 52,
              )
            : CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }

  Widget buildButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          fixedSize: Size(350, 90),
          side: BorderSide(width: 2, color: Colors.indigo),
        ),
        onPressed: () async {
          setState(() {
            state = ButtonState.loading;
          });
          await Future.delayed(Duration(seconds: 2)).then((value) {
            setState(() {
              state = ButtonState.done;
            });
          });
          await Future.delayed(Duration(seconds: 2)).then((value) {
            setState(() {
              state = ButtonState.init;
            });
          });
        },
        child: Text(
          "Entrar",
          style: TextStyle(
              fontSize: 24,
              color: Colors.indigo,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600),
        ),
      );

  Widget isLoading(bool isloading) {
    if (isloading == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(
            width: 25,
          ),
          Text("Aguarde")
        ],
      );
    } else {
      return const Text("Botao");
    }
  }
}
