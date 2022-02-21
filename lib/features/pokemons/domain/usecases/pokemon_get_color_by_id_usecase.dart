import 'package:dartz/dartz.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/pokemon_repository.dart';

class GetColorPokemonUseCase implements IUseCase<ColorsEntity, String> {
  const GetColorPokemonUseCase(this.repository);

  final IPokemonRepository repository;

  @override
  Future<Either<Exception, ColorsEntity>> call(String id) async {
    return repository.getByColorId(id);
  }
}
