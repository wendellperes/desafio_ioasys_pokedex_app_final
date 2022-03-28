

import 'package:get_it/get_it.dart';
import 'package:pekedex_ioasys/features/pokemons/data/datasource/pokemon_datasource.dart';
import 'package:pekedex_ioasys/features/pokemons/data/repository/pokemon_repository_impl.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/repositories/pokemon_repository.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_get_by_id_usecase.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:pekedex_ioasys/features/pokemons/presentation/controllers/home_page_controller.dart';

import '../features/pokemons/domain/usecases/pokemon_get_by_name_usecase.dart';
import '../features/pokemons/presentation/controllers/details_page_controller.dart';
//ignore_for_file: cascade_invocations

GetIt serviceLocator = GetIt.instance;

void setupAppDependencies() {
  serviceLocator
    ..registerLazySingleton<HomePageController>(
      () => HomePageController(
        pokemonListarAllUsecase:
            serviceLocator.get<PokemonListarAllUseCase>(),
        pokemonListarByNameUseCase:
            serviceLocator.get<PokemonListarByNameUseCase>(),
      ),
    )
    ..registerLazySingleton<DetailsPageController>(
      () => DetailsPageController(
        getPokemonByIdUseCase: serviceLocator.get<GetPokemonByIdUseCase>(),
        controllerTheme: serviceLocator.get<HomePageController>(),
      ),
    )
    ..registerLazySingleton<IPokemonRepository>(
      () => PokemonRepositoryImpl(
        serviceLocator.get<IPokemonsNetworkDatasource>(),
      ),
    )
    ..registerLazySingleton<IPokemonsNetworkDatasource>(
      () => PokemonsNetworkDatasource(),
    )
    ..registerLazySingleton<PokemonListarAllUseCase>(
      () => PokemonListarAllUseCase(
        serviceLocator.get<IPokemonRepository>(),
      ),
    )
    ..registerLazySingleton<GetPokemonByIdUseCase>(
      () => GetPokemonByIdUseCase(
        serviceLocator.get<IPokemonRepository>(),
      ),
    )
    ..registerLazySingleton<PokemonListarByNameUseCase>(
      () => PokemonListarByNameUseCase(
        serviceLocator.get<IPokemonRepository>(),
      ),
    );
}

void setupDependencies() {
  setupAppDependencies();
}
