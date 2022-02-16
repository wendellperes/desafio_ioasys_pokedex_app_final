import 'package:dartz/dartz.dart';

import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/usuario_entity.dart';
import '../repositories/usuario_repository.dart';

class ListAllUseCase implements IUseCase<List<UsuarioEntity>, NoParams> {
  const ListAllUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, List<UsuarioEntity>>> call(NoParams params) async {
    return repository.listAll();
  }
}