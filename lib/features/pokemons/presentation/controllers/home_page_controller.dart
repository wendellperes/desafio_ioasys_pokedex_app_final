
import 'package:flutter/material.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:pekedex_ioasys/utils/app_state.dart';

import '../../domain/usecases/pokemon_get_by_name_usecase.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({
    required this.pokemonListarAllUsecase,
    required this.pokemonListarByNameUseCase,
  });

  final PokemonListarAllUseCase pokemonListarAllUsecase;
  final PokemonListarByNameUseCase pokemonListarByNameUseCase;

  AppState state = AppState.empty();
  final List<PokemonEntity> dataResult = [];
  final isDark = ValueNotifier<bool>(false);
  final theme = ValueNotifier<Color>(Colors.white);

  List<PokemonEntity> get pokemonsall =>
      state.when(success: (value) => value, orElse: () => []);

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> changeTheme(bool isHabilitTheme) async {
    isDark.value = isHabilitTheme;
    if (isDark.value) {
      theme.value = Colors.black;
    } else {
      theme.value = Colors.white;
    }
  }

  Future<void> getData(String? limit) async {
    try {
      update(AppState.loading());
      final pokemonsResult = await pokemonListarAllUsecase(limit);
      pokemonsResult.fold((_) => {}, (r) {
        dataResult.addAll(r);
      });
      update(AppState.success<List<PokemonEntity>>(dataResult));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

  Future<void> getPokemonByName(String name) async {
    try {
      update(AppState.loading());
      dataResult.clear();
      final pokemonsResult = await pokemonListarByNameUseCase(name);
      pokemonsResult.fold((l) => null, (r){
        dataResult.addAll(r);
      });
      update(AppState.success<List<PokemonEntity>>(dataResult));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}
