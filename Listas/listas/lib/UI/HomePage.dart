// ignore: file_names
import 'package:flutter/material.dart';
import 'package:listas/UI/UnidadeFederativaPage.dart';
import 'package:listas/config/ConfigCores.dart';
import 'package:listas/config/ConfigFonts.dart' show ConfigFonts;
import 'package:listas/models/Regioes.dart';
import 'package:listas/services/RegiaoService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  List<RegiaoModel> listRegioes = [];

  RegiaoService regiaoService = RegiaoService();

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
    regiaoService.listRegion().then((value) {
      setState(() {
        listRegioes = value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
        backgroundColor: ConfigCores().colorfundoClaro,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ConfigCores().colorAppBar,
          title: Text(
            'Dados Geograficos',
            style: ConfigFonts().styleAppBar,
          ),
        ),
        body: listRegioes.isEmpty
            // ignore: prefer_const_constructors
            ? Center(
                child: const CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : FadeTransition(
                opacity: animation,
                child: ReorderableListView.builder(
                    itemCount: listRegioes.length,
                    proxyDecorator:
                        (Widget child, int index, Animation<double> animation) {
                      return Material(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 195, 146),
                              border: Border.all(
                                  color: Colors.transparent, width: 1)),
                          child: child,
                        ),
                      );
                    },
                    onReorder: (oldIndex, newIndex) => setState(() {
                          final index =
                              newIndex > oldIndex ? newIndex - 1 : newIndex;
                          final regiao = listRegioes.removeAt(oldIndex);
                          listRegioes.insert(index, regiao);
                        }),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        key: ValueKey(listRegioes[index]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: ConfigCores().colorAppBarGradiente1,
                            child: ListTile(
                                trailing: Text(
                                  listRegioes[index].sigla,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                title: Text(
                                  listRegioes[index].nome,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UnidadeFederetivaPage(
                                      regiao: listRegioes[index])));
                        },
                      );
                    }),
              ));
  }
}
