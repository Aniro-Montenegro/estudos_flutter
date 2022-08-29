// ignore: file_names
import 'dart:convert';

import 'package:listas/models/UnidadeFederativa.dart';

import 'package:http/http.dart' as http;

class UnidadeFederetivaService {
  Future<List<UnidadeFederativaModel>> listUnidadesFederativaRegiao(
      String regiao) async {
    List<UnidadeFederativaModel> lista = [];

    var url = Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/regioes/$regiao/estados');

    return await http.get(url, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    }).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        final jsonresponse = json.decode(value.body);
        for (var regiao in jsonresponse) {
          UnidadeFederativaModel unidadeFederativaModel =
              UnidadeFederativaModel.fromMap(regiao);
          lista.add(unidadeFederativaModel);
        }
        return lista;
      } else {
        return lista;
      }
    });
  }
}
