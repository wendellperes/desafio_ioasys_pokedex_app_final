import 'package:dartz/dartz.dart';

import '../../domain/entities/usuario_entity.dart';
import '../../domain/repositories/usuario_repository.dart';
import '../datasource/usuario_datasource.dart';

class FaqExtraRepositoryImpl implements IUsuarioRepository {
  final IUsuarioNetworkDataSource _usuarioDataSource;
  FaqExtraRepositoryImpl(this._usuarioDataSource,);

  @override
  Future<Either<Exception, List<UsuarioEntity>>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> listById(String id) {
    // TODO: implement listById
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> register(UsuarioEntity usuarioEntity) {
    // TODO: implement register
    throw UnimplementedError();
  }

 
}