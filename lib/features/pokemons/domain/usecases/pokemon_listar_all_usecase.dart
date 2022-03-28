import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/pokemon_repository.dart';

class PokemonListarAllUseCase
    implements IUseCase<List<PokemonEntity>, String?> {
  const PokemonListarAllUseCase(this.repository);

  final IPokemonRepository repository;

  @override
  Future<Either<Exception, List<PokemonEntity>>> call(limit) async {
    return repository.listAll(limit);
  }
}
