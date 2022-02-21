// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResultModel _$PokemonResultModelFromJson(Map<String, dynamic> json) =>
    PokemonResultModel(
      idPokemon: json['idPokemon'] as int?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stats: (json['stats'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PokemonResultModelToJson(PokemonResultModel instance) =>
    <String, dynamic>{
      'idPokemon': instance.idPokemon,
      'abilities': instance.abilities,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
    };
