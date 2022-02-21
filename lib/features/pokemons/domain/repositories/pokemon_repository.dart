import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/color_pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/result_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/result_Pokemon._entity.dart';

import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<Either<Exception, PokemonResultEntity>> getPokemonById(String id);
  Future<Either<Exception, List<PokemonEntity>>> listAll(String? limit);
  Future<Either<Exception, List<PokemonEntity>>> listByName(String name);
}
