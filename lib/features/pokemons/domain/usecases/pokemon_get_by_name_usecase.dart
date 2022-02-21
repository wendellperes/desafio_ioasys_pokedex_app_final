import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/result_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/pokemon_repository.dart';

class PokemonListarByNameUseCase implements IUseCase< List<PokemonEntity>, String> {
  const PokemonListarByNameUseCase(this.repository);

  final IPokemonRepository repository;

  @override
  Future<Either<Exception, List<PokemonEntity>>> call(String name) async {
    return repository.listByName(name);
  }
}
