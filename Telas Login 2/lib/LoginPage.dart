


import 'package:flutter/material.dart';
import 'package:tela_login_2/padrao_cores.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _widgetId = 1;

  Widget _renderWidget1() {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.35,
          width: MediaQuery.of(context).size.width*0.85,

        child: Card(
          key: Key('first'),
          color: PadraoCores.gradiente1,

          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: PadraoCores.texto,



                  decoration: InputDecoration(


                    labelText: 'e-mail',
                    labelStyle: TextStyle(
                      color: PadraoCores.splascreen,
                    ),
                    helperText: '',

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: PadraoCores.gradiente2),
                    ),

                  ),
                  style: TextStyle(color: PadraoCores.texto),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderWidget2() {
    return Container(
      key: Key('second'),
      width: 90,
      height: 150,
      color: Colors.red,
      child: const Center(
        child: const Text(
            'Woolha.com',
            style: const TextStyle(fontSize: 24, color: Colors.white)
        ),
      ),
    );
  }

  Widget _renderWidget() {
    return _widgetId == 1 ? _renderWidget1() : _renderWidget2();
  }

  void _updateWidget() {
    setState(() {
      _widgetId = _widgetId == 1 ? 2 : 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: _renderWidget(),
            ),
            RaisedButton(
              child: const Text('Change Widget'),
              onPressed: () {
                _updateWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}