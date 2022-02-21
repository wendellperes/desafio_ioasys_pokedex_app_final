import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:pekedex_ioasys/utils/app_state.dart';

import '../../../../core/usecases/no_params.dart';
import '../../domain/entities/result_Pokemon._entity.dart';
import '../../domain/usecases/pokemon_get_by_name_usecase.dart';
import '../../domain/usecases/pokemon_get_by_id_usecase.dart';

class DetailsPageController extends ChangeNotifier {
  DetailsPageController({
    required this.getPokemonByIdUseCase,
  });

  final GetPokemonByIdUseCase getPokemonByIdUseCase;

  AppState state = AppState.empty();
 PokemonResultEntity dataPokemon = PokemonResultEntity.empty();

  final isDark = ValueNotifier<bool>(false);
  final theme = ValueNotifier<Color>(Colors.white);

 PokemonResultEntity get pokemonsall =>
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

  Future<void> getData(String id) async {
    try {
      update(AppState.loading());
      final pokemonsResult = await getPokemonByIdUseCase(id);
      pokemonsResult.fold((_) => {}, (r) {
        dataPokemon = r;
      });
      update(AppState.success<PokemonResultEntity>(dataPokemon));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

 
}
