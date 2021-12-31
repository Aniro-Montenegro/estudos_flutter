import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tela_login_1/padrao_cores.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _senhaController = TextEditingController();
  final _emailController = TextEditingController();
  final _enviarEmailController = TextEditingController();

  bool _isHidden = true;
  bool _isLoading = false;
  bool _isVisivel = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          drawer: null,
          body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  PadraoCores.gradiente1,
                  PadraoCores.gradiente2,
                  PadraoCores.gradiente2,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.all(16.0),
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    /*Center(
                      child: Container(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('imagens/fundo.png'),
                          width: 200,
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                        child: Text("Login",
                            style: GoogleFonts.ptSerif(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                        height: 100.0,
                        child: _isLoading == true
                            ? Center(
                                child: JumpingText(
                                  'Aguarde...',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              )
                            : Container(
                                color: Colors.transparent,
                              )),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (term) {
                        if (_formKey.currentState!.validate()) {
                          login();
                        } else {
                          // login();

                        }
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (text) {
                        if (text!.isEmpty || !text.contains("@"))
                          return "Email inválido";
                        else {
                          setState(() {});
                        }
                      },
                      onChanged: (e) {
                        print(e);
                      },
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                        controller: _senhaController,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (term) {
                          if (_formKey.currentState!.validate()) {
                            login();
                          } else {
                            // login();

                          }
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: _isVisivel == true
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          hintText: "Senha",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        obscureText: _isHidden,
                        // ignore: missing_return
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6)
                            return "Senha inválida";
                          else {
                            setState(() {
                              //  credencias.setSenha = _senhaController.text;
                            });
                          }
                        },
                        onChanged: (n) {
                          print(n);
                        }),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            } else {
                              // login();

                            }
                          },
                          child: Text(
                            "ACESSAR",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        confirmarTrocarSenha();
                      },
                      child: Text(
                        "ESQUECI A SENHA",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
      _isVisivel = !_isVisivel;
    });
  }

  Future<void> login() async {}

  confirmarTrocarSenha() {
    if (_emailController.text.isNotEmpty) {
      _enviarEmailController.text = _emailController.text;
    }
    return Alert(
      style: AlertStyle(
        backgroundColor: PadraoCores.texto
      ),
        context: context,
        title: "Confirmar troca de senha",
        content: Column(
          children: <Widget>[],
        ),
        buttons: [
          DialogButton(
            color: PadraoCores.gradiente3,
            onPressed: () {
              Navigator.pop(context);
              trocarSenha();
            },
            child: Text(
              "Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            color: PadraoCores.gradiente1,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  trocarSenha() {
    if (_emailController.text.isNotEmpty) {
      _enviarEmailController.text = _emailController.text;
    }
    return Alert(
        context: context,
        title: "Insira o seu e-mail",
        content: Column(
          children: <Widget>[
            TextField(
              controller: _enviarEmailController,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'E-mail',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Enviar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
