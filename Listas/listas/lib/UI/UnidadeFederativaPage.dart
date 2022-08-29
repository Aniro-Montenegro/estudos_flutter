import 'package:flutter/material.dart';
import 'package:listas/config/ConfigCores.dart';
import 'package:listas/models/Regioes.dart';

import 'package:listas/services/UnidadeFederativaService.dart';

import '../config/ConfigFonts.dart';
import '../models/UnidadeFederativa.dart';

class UnidadeFederetivaPage extends StatefulWidget {
  const UnidadeFederetivaPage({Key? key, required this.regiao})
      : super(key: key);

  final RegiaoModel regiao;

  @override
  State<UnidadeFederetivaPage> createState() => _UnidadeFederetivaPageState();
}

class _UnidadeFederetivaPageState extends State<UnidadeFederetivaPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  List<UnidadeFederativaModel> listUF = [];

  UnidadeFederetivaService unidadeService = UnidadeFederetivaService();

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
    unidadeService
        .listUnidadesFederativaRegiao(widget.regiao.id.toString())
        .then((value) {
      setState(() {
        listUF = value;
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
            'Unidade Federativa',
            style: ConfigFonts().styleAppBar,
          ),
        ),
        body: listUF.isEmpty
            // ignore: prefer_const_constructors
            ? Center(
                child: const CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : FadeTransition(
                opacity: animation,
                child: ReorderableListView.builder(
                    header: ListTile(
                      title: Text(
                        'Região ${widget.regiao.nome}',
                        style: const TextStyle(color: Color(0xFF1C7319)),
                      ),
                      trailing: Text(
                        '${listUF.length} estados',
                        style: const TextStyle(color: Color(0xFF1C7319)),
                      ),
                    ),
                    itemCount: listUF.length,
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
                          final regiao = listUF.removeAt(oldIndex);
                          listUF.insert(index, regiao);
                        }),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        key: ValueKey(listUF[index]),
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Card(
                            color: ConfigCores().colorAppBarGradiente1,
                            elevation: 3.5,
                            child: ListTile(
                                trailing: Text(
                                  listUF[index].sigla,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                title: Text(
                                  listUF[index].nome,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                          onTap: () {},
                        ),
                      );
                    }),
              ));
  }
}
