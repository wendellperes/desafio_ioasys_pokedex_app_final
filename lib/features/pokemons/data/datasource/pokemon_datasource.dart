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
  Future<List<ResultsModel>> listAll(String? limit);
  Future<PokemonResultModel> listPokemonById(String id);
  Future<ColorModel> getColor(String id);
  Future<List<ResultsModel>> listByName(String name);
}

class PokemonsNetworkDatasource extends IPokemonsNetworkDatasource {
  @override
  Future<List<ResultsModel>> listAll(String? limit) async {
    try {
      String endpoint = '';
      if (limit != '') {
         endpoint = '${PokeAPIEndpoints.getAllPokemon}?offset=${limit}&limit=20';
      }else{
         endpoint = '${PokeAPIEndpoints.getAllPokemon}';
      }
      final response = await Dio(
          BaseOptions(
            baseUrl: PokeAPIEndpoints.urlBase,
          ),
        ).get(endpoint);

      final List result = response.data['results'];
      final resultModel = result
          .map<ResultsModel>((data) => ResultsModel.fromJson(data))
          .toList();
      return resultModel;
    } catch (e, stack) {
      throw Exception;
    }
  }

  @override
  Future<PokemonResultModel> listPokemonById(String id) async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon/${id}");
      final result = response.data;

      final responseColorAndDescription = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon-species/${result['id']}");
      final String color = responseColorAndDescription.data['color']['name'];
      final String description = responseColorAndDescription
          .data['flavor_text_entries'][0]['flavor_text'];

      final List resultAbilities = response.data['abilities'];
      final List resultType = response.data['types'];
      final List resultStatus = response.data['stats'];
      final powers = [];
      final type = [];
      final status = [];

      resultAbilities.forEach((element) {
        powers.add(element['ability']['name']);
        print(element['ability']['name']);
      });
      resultType.forEach((element) {
        type.add(element['type']['name']);
        print(element['type']['name']);
      });

      resultStatus.forEach((element) {
        status.add(element['base_stat']);
      });
      var dataPokemon = {
        'idPokemon': result['id'],
        'abilities': powers,
        'name': result['name'],
        'color': color,
        'description': description,
        'height': result['height'],
        'weight': result['weight'],
        'types': type,
        'stats': status,
      };
      print(dataPokemon);

      final resultModel = PokemonResultModel.fromJson(dataPokemon);
      return resultModel;
    } catch (e, stack) {
      throw Exception;
    }
  }

  @override
  Future<List<ResultsModel>> listByName(String name) async {
    final List resposta = [];
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("${PokeAPIEndpoints.getAllPokemon}${name}");
      final result = response.data;
      var dataPokemon = {
        'name': result['name'],
        'url':
            "${PokeAPIEndpoints.urlBase}${PokeAPIEndpoints.getAllPokemon}${result['id']}/",
      };
      resposta.add(dataPokemon);

      final resultModel = resposta
          .map<ResultsModel>((data) => ResultsModel.fromJson(data))
          .toList();
      return resultModel;
    } catch (e, stack) {
      throw Exception;
    }
  }

  @override
  Future<ColorModel> getColor(String id) async {
    try {
      final responseColorAndDescription = await Dio(
        BaseOptions(
          baseUrl: PokeAPIEndpoints.urlBase,
        ),
      ).get("/pokemon-species/${id}");
      final result = responseColorAndDescription.data['color'];
      final reultColorModel = ColorModel.fromJson(result);
      //final resultModel = result.map<ResultsModel>((data) => ResultsModel.fromJson(data))
      //  .toList();
      return reultColorModel;
    } catch (e, stack) {
      throw Exception;
    }
  }
}
