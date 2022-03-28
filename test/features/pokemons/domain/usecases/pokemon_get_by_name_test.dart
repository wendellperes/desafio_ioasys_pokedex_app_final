
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/repositories/pokemon_repository.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRepository extends Mock implements IPokemonRepository {}


void main() {
  late MockPokemonRepository repository;
  late PokemonListarAllUseCase usuarioListUsecase;
  final List<PokemonEntity> pokemonEntityInitial = [
    const PokemonEntity(
      name: 'bulbasaur',
      url: "https://pokeapi.co/api/v2/pokemon/1/",
    ),
    const PokemonEntity(
      name: 'ivysaur',
      url: "https://pokeapi.co/api/v2/pokemon/2/",
    ),
    const PokemonEntity(
      name: 'charmander',
      url: "https://pokeapi.co/api/v2/pokemon/4/",
    ),
  ];

  setUpAll(() {
    repository = MockPokemonRepository();
    usuarioListUsecase = PokemonListarAllUseCase(repository);
    registerFallbackValue(List<PokemonEntity>);
  });

  void setWhenSuccess(List<PokemonEntity> pokemonEntity) {
    when(() => repository.listAll('bulbasaur'))
        .thenAnswer((_) async => Right(pokemonEntity));
  }

  group('Obter um Pokemon: ', () {
    test('Deve retornar um objeto do tipo Lista de pokemonEntity como sucesso mais o mesmo sendo unico!',
        () async {
      setWhenSuccess(pokemonEntityInitial);

      final result = await usuarioListUsecase('bulbasaur');

      result.fold((_) => _, (r) {
        expect(r, pokemonEntityInitial);
      });
      verify(() => repository.listAll('bulbasaur')).called(1);
    });

    test('Deve retornar uma Exception caso o usuario digite o nome do pokemon errado', () async {
      when(() => repository.listAll('aaaaa'))
          .thenAnswer((_) async => Left(Exception()));

      final result = await usuarioListUsecase('aaaaa');
      result.fold((l) {
        expect(l, isA<Exception>());
      }, (r) => null);
       verify(() => repository.listAll('aaaaa')).called(1);
    });
  });
}
