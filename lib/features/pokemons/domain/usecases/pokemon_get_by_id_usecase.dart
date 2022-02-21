import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/result_Pokemon._entity.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonByIdUseCase implements IUseCase<PokemonResultEntity, String> {
  const GetPokemonByIdUseCase(this.repository);

  final IPokemonRepository repository;

  @override
  Future<Either<Exception, PokemonResultEntity>> call(String id) async {
    return repository.getPokemonById(id);
  }
}
