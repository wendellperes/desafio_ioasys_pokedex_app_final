
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../repositories/usuario_repository.dart';

class GetUserByIdUseCase implements IUseCase<bool, String> {
  const GetUserByIdUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, bool>> call(String id) async {
    return repository.listById(id);
  }
}
