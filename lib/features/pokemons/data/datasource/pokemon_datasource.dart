import 'package:dio/dio.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/color_pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/pokemon_model.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/result_model.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/color_pokemon_entity.dart';

import '../../../../consts/const_endpoints.dart';
import '../../../../core/service/dio.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/usuario_entity.dart';

abstract class IPokemonsNetworkDatasource {
  Future<List<ResultsModel>> listAll();
  Future<PokemonEntity> listById(String id);
  Future<ColorModel> getColor(String id);
  Future<PokemonModel> listByName(String name);
}

class PokemonsNetworkDatasource extends IPokemonsNetworkDatasource {
  @override
  Future<List<ResultsModel>> listAll() async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon");
      final result = response.data['results'];
      final resultModel = result
          .map<ResultsModel>((data) => ResultsModel.fromJson(data))
          .toList();
      return resultModel;
    } catch (e, stack) {
      throw Exception;
    }
  }

  @override
  Future<PokemonEntity> listById(String id) async {
    try {
      return PokemonEntity.empty();
      // final response =
      //     await _httpClient.get('${PixEndpoints.faqTopic}${topic}');
      // final result = FaqPixModel.fromJson(response.data[0]);
      // return result;
      //TODO: Fazer uma chamada Usando o DIO

    } catch (e, stack) {
      throw Exception;
      // await _logService.recordError(e, stack);
      // throw ServerException.fromMap(e.data);
      //TODO: Realizar tratamento de erros
    }
  }

  @override
  Future<PokemonModel> listByName(String name) async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon/${name}");
      final result = response.data;
      final resultModel = result
          .map<PokemonModel>((data) => PokemonModel.fromJson(data))
          .toList();
      return resultModel;
    } catch (e, stack) {
      throw Exception;
    }
  }

  @override
  Future<ColorModel> getColor(String id) async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon-species/${id}");
      final result = response.data['color'];
      final reultColorModel = ColorModel.fromJson(result);
      //final resultModel = result.map<ResultsModel>((data) => ResultsModel.fromJson(data))
      //  .toList();
      return reultColorModel;
    } catch (e, stack) {
      throw Exception;
    }
  }
}
