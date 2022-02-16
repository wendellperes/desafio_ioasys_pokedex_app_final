// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      name: json['name'] as String,
      email: json['email'] as String,
      nascimento: json['nascimento'] as String,
      sexo: json['sexo'] as String,
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'nascimento': instance.nascimento,
      'sexo': instance.sexo,
    };
