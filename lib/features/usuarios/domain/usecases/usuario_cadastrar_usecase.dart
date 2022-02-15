import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../entities/usuario_entity.dart';
import '../repositories/usuario_repository.dart';

class CadastrarUseCase implements IUseCase<bool, UsuarioEntity> {
  const CadastrarUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, bool>> call(UsuarioEntity params) async {
    return repository.register(params);
  }
}
