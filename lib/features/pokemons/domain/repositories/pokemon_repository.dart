import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<Either<Exception, bool>> getById(String id);
  Future<Either<Exception, List<PokemonEntity>>> listAll();
  Future<Either<Exception, bool>> listByName(String name);
}