// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: file_names
class UnidadeFederativaModel {
  int id;
  String sigla;
  String nome;
  Regiao regiao;
  UnidadeFederativaModel({
    required this.id,
    required this.sigla,
    required this.nome,
    required this.regiao,
  });

  UnidadeFederativaModel copyWith({
    int? id,
    String? sigla,
    String? nome,
    Regiao? regiao,
  }) {
    return UnidadeFederativaModel(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
      regiao: regiao ?? this.regiao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'nome': nome,
      'regiao': regiao.toMap(),
    };
  }

  factory UnidadeFederativaModel.fromMap(Map<String, dynamic> map) {
    return UnidadeFederativaModel(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
      regiao: Regiao.fromMap(map['regiao'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UnidadeFederativaModel.fromJson(String source) =>
      UnidadeFederativaModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UnidadeFederativaModel(id: $id, sigla: $sigla, nome: $nome, regiao: $regiao)';
  }

  @override
  bool operator ==(covariant UnidadeFederativaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sigla == sigla &&
        other.nome == nome &&
        other.regiao == regiao;
  }

  @override
  int get hashCode {
    return id.hashCode ^ sigla.hashCode ^ nome.hashCode ^ regiao.hashCode;
  }
}

class Regiao {
  int id;
  String sigla;
  String nome;
  Regiao({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  Regiao copyWith({
    int? id,
    String? sigla,
    String? nome,
  }) {
    return Regiao(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory Regiao.fromMap(Map<String, dynamic> map) {
    return Regiao(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Regiao.fromJson(String source) =>
      Regiao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Regiao(id: $id, sigla: $sigla, nome: $nome)';

  @override
  bool operator ==(covariant Regiao other) {
    if (identical(this, other)) return true;

    return other.id == id && other.sigla == sigla && other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ sigla.hashCode ^ nome.hashCode;
}
