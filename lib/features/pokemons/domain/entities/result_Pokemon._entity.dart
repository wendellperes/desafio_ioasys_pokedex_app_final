import 'package:equatable/equatable.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';

import '../../../../consts/global_string_empty.dart';


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
  factory PokemonResultEntity.fromEntity(PokemonResultModel model) =>
      PokemonResultEntity(
        idPokemon: model.idPokemon,
        abilities: model.abilities,
        name:  model.name,
        color: model.color,
        description: model.description,
        height: model.height,
        weight: model.weight,
        types: model.types,
        stats: model.stats,
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
