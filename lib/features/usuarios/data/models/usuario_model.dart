import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/usuario_entity.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class UsuarioModel extends Equatable {
  const UsuarioModel({
    required this.name,
    required this.email,
    required this.nascimento,
    required this.sexo,
  });
  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  factory UsuarioModel.fromModel(UsuarioEntity usuarioEntity) => UsuarioModel(
        name: usuarioEntity.name,
        email: usuarioEntity.email,
        nascimento: usuarioEntity.nascimento,
        sexo: usuarioEntity.sexo,
      );

  final String name;
  final String email;
  final String nascimento;
  final String sexo;

  @override
  List<Object?> get props => [
        name,
        email,
        nascimento,
        sexo,
      ];
}
