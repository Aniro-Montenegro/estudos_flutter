// ignore: file_names
import 'dart:convert';

import '../models/Regioes.dart';
import 'package:http/http.dart' as http;

class RegiaoService {
  Future<List<RegiaoModel>> listRegion() async {
    List<RegiaoModel> lista = [];

    var url = Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/regioes');

    return await http.get(url, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    }).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        final jsonresponse = json.decode(value.body);
        for (var regiao in jsonresponse) {
          RegiaoModel regiaoModel = RegiaoModel.fromMap(regiao);
          lista.add(regiaoModel);
        }
        return lista;
      } else {
        return lista;
      }
    });
  }
}
