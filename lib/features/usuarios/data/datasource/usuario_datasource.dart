
import '../../domain/entities/usuario_entity.dart';

abstract class IUsuarioNetworkDataSource {
  Future<List<UsuarioEntity>> listAll();
  Future<UsuarioEntity> listById(String id);
  Future<bool> register(UsuarioEntity usuarioEntity);
}
class FaqNetworkDatasource implements IUsuarioNetworkDataSource {

  @override
  Future<List<UsuarioEntity>> listAll() async {
    try {
      List<UsuarioEntity> dataEntity = [];
      return dataEntity;
      // final response = await _httpClient.get(PixEndpoints.listAndUpdateLimit);
      // // ignore: avoid_dynamic_calls
      // return await dataEntity
      //     .map<LimitModel>((data) => LimitModel.fromJson(data))
      //     .toList();
      // //TODO: Fazer uma chamada Usando o DIO
      
    } catch (e, stack) {
      throw Exception;
      // await _logService.recordError(e, stack);
      // throw ServerException.fromMap(e.data);
      //TODO: Realizar tratamento de erros
    }
  }

  @override
  Future<UsuarioEntity> listById(String id) async {
    try {
      return UsuarioEntity.empty();
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
  Future<bool> register(UsuarioEntity usuarioEntity) async {
    try {
      return true;
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

}