import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/color_pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';

import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<Either<Exception, ColorsEntity>> getByColorId(String id);
  Future<Either<Exception, List<PokemonEntity>>> listAll();
  Future<Either<Exception, PokemonModel>> listByName(String name);
  Future<PokemonEntity> listById(String id);
}
