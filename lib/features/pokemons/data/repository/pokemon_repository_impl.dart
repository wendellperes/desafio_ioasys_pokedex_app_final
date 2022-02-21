import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/color_pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';

import '../datasource/pokemon_datasource.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  final IPokemonsNetworkDatasource _pokemonDataSource;
  PokemonRepositoryImpl(
    this._pokemonDataSource,
  );

  @override
  Future<Either<Exception, List<PokemonEntity>>> listAll() async {
    try {
      final result = await _pokemonDataSource.listAll();
      final resultParse = result.map<PokemonEntity>((e) => e.entity).toList();
      return Right(resultParse);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, PokemonModel>> listByName(String name) async {
    try {
      final result = await _pokemonDataSource.listByName(name);
      print(result.name);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, ColorsEntity>> getByColorId(String id) async {
    try {
      final result = await _pokemonDataSource.getColor(id);
      final resultParse = ColorsEntity.fromEntity(result);
      return Right(resultParse);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<PokemonEntity> listById(String id) {
    // TODO: implement listById
    throw UnimplementedError();
  }
}
