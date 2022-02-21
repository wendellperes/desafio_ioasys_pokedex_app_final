import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/pokemon_repository.dart';

class PokemonListar_all_UseCase
    implements IUseCase<List<PokemonEntity>, NoParams> {
  const PokemonListar_all_UseCase(this.repository);

  final IPokemonRepository repository;

  @override
  Future<Either<Exception, List<PokemonEntity>>> call(NoParams params) async {
    return repository.listAll();
  }
}
