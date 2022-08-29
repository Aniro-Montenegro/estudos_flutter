// ignore: file_names
import 'dart:convert';

class RegiaoModel {
  int id;
  String sigla;
  String nome;
  RegiaoModel({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  RegiaoModel copyWith({
    int? id,
    String? sigla,
    String? nome,
  }) {
    return RegiaoModel(
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

  factory RegiaoModel.fromMap(Map<String, dynamic> map) {
    return RegiaoModel(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegiaoModel.fromJson(String source) =>
      RegiaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegiaoModel(id: $id, sigla: $sigla, nome: $nome)';

  @override
  bool operator ==(covariant RegiaoModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.sigla == sigla && other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ sigla.hashCode ^ nome.hashCode;
}
