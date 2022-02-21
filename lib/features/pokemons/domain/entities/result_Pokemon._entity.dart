import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../consts/globalString_empty.dart';

class PokemonResultEntity extends Equatable {
  const PokemonResultEntity({
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

  factory PokemonResultEntity.empty() =>const  PokemonResultEntity(
        idPokemon: 0,
        abilities: [],
        name:  GlobalConstants.emptyString,
        color: GlobalConstants.emptyString,
        description: GlobalConstants.emptyString,
        height:0,
        weight:0,
        types:[],
        stats:[],
      );
  factory PokemonResultEntity.fromEntity(PokemonResultEntity entity) =>
      PokemonResultEntity(
        idPokemon: entity.idPokemon,
        abilities: entity.abilities,
        name:  entity.name,
        color: entity.color,
        description: entity.description,
        height: entity.height,
        weight: entity.weight,
        types: entity.types,
        stats: entity.stats,
      );

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
