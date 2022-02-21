import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/result_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/result_Pokemon._entity.dart';
import '../../domain/repositories/pokemon_repository.dart';

import '../datasource/pokemon_datasource.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  final IPokemonsNetworkDatasource _pokemonDataSource;
  PokemonRepositoryImpl(
    this._pokemonDataSource,
  );

  @override
  Future<Either<Exception, List<PokemonEntity>>> listAll(String? limit) async {
    try {
      final result = await _pokemonDataSource.listAll(limit);
      final resultParse = result.map<PokemonEntity>((e) => e.entity).toList();
      return Right(resultParse);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<PokemonEntity>>> listByName(String name) async {
    try {
      final result = await _pokemonDataSource.listByName(name);
      final resultparse = result.map<PokemonEntity>((e) => e.entity).toList();
      return Right(resultparse);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, PokemonResultEntity>> getPokemonById(String id) async {
    try {
      final result = await _pokemonDataSource.listPokemonById(id);
      final resultParse = PokemonResultEntity.fromEntity(result);
      return Right(resultParse);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
