import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:pekedex_ioasys/utils/app_state.dart';

import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/pokemon_get_by_name_usecase.dart';
import '../../domain/usecases/pokemon_get_color_by_id_usecase.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({
    required this.pokemonListarAllUsecase,
    required this.getColorPokemonUseCase,
    required this.pokemonListarByNameUseCase,
  });

  final PokemonListar_all_UseCase pokemonListarAllUsecase;
  final GetColorPokemonUseCase getColorPokemonUseCase;
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

  Future<void> getData() async {
    try {
      update(AppState.loading());
      final pokemonsResult = await pokemonListarAllUsecase(NoParams());
      pokemonsResult.fold((_) => {}, (r) {
        r.forEach((element) {
          dataResult.add(
            PokemonEntity(name: element.name, url: element.url),
          );
        });
      });
      update(AppState.success<List<PokemonEntity>>(dataResult));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

  Future<void> getPokemonByName(String name) async {
    try {
      update(AppState.loading());
      final pokemonsResult = await pokemonListarByNameUseCase(name);
      update(AppState.success<List<PokemonEntity>>(dataResult));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}
