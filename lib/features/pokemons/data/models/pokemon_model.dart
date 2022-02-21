import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';

import '../../domain/entities/result_Pokemon._entity.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonResultModel extends Equatable {
  PokemonResultModel({
    required this.idPokemon,
    required this.abilities,
    required this.name,
    required this.color,
    required this.description,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
  });

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultModelFromJson(json);
  PokemonResultEntity get entity => PokemonResultEntity(
        idPokemon: idPokemon,
        abilities: abilities,
        name:  name,
        color: color,
        description: description,
        height: height,
        weight: weight,
        types: types,
        stats: stats,
      );

  Map<String, dynamic> toJson() => _$PokemonResultModelToJson(this);
  final int? idPokemon;
  final List<String>? abilities;
  final String? name;
  final String? color;
  final String? description;
  final int? height;
  final int? weight;
  final List<String>? types;
  final List<int>? stats;

  @override
  // TODO: implement props
  List<Object?> get props => [
        idPokemon,
        abilities,
        name,
        color,
        description,
        height,
        weight,
        types,
        stats,
      ];
}
