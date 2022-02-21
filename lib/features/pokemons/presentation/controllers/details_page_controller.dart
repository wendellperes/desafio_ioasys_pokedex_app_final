import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/usecases/pokemon_listar_all_usecase.dart';
import 'package:pekedex_ioasys/utils/app_state.dart';

import '../../../../core/usecases/no_params.dart';
import '../../domain/entities/result_Pokemon._entity.dart';
import '../../domain/usecases/pokemon_get_by_name_usecase.dart';
import '../../domain/usecases/pokemon_get_by_id_usecase.dart';
import 'home_page_controller.dart';

class DetailsPageController extends ChangeNotifier {
  DetailsPageController({
    required this.getPokemonByIdUseCase,
    required this.controllerTheme,
  });

  final GetPokemonByIdUseCase getPokemonByIdUseCase;
  final  HomePageController controllerTheme;

  AppState state = AppState.empty();
 PokemonResultEntity dataPokemon = PokemonResultEntity.empty();

  final isDark = ValueNotifier<bool>(false);
  final theme = ValueNotifier<Color>(Colors.white);


 PokemonResultEntity get pokemonsall =>
      state.when(success: (value) => value, orElse: () => []);

  void update(AppState state) {
    this.state = state;
    theme.value = controllerTheme.theme.value;
    if(controllerTheme.isDark.value){
      isDark.value = true;
      theme.value = Colors.black;
    }else{
      isDark.value = false;
      theme.value = Colors.white;
    }
    notifyListeners();
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
