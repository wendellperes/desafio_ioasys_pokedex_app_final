
import 'package:app_base_clean/core/usecases/no_params.dart';
import 'package:app_base_clean/features/usuarios/domain/entities/usuario_entity.dart';
import 'package:app_base_clean/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:app_base_clean/features/usuarios/domain/usecases/usuario_listar_all_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsuarioRepository extends Mock implements IUsuarioRepository {}

class FakeUsuarioEntity extends Fake implements UsuarioEntity {}

void main() {
  late MockUsuarioRepository repository;
  late ListAllUseCase usuarioListUsecase;
  final List<UsuarioEntity> usuarioEntityInitial = [
    UsuarioEntity(
      name: 'Wendell Caco',
      email: 'email@hotmmail.com',
      nascimento: '10/02/7878',
      sexo: 'M',
      ),
  ];

  setUpAll(() {
    repository = MockUsuarioRepository();
    usuarioListUsecase = ListAllUseCase(repository);
    registerFallbackValue(List<FakeUsuarioEntity>);
  });

  void setWhenSuccess(List<UsuarioEntity> usuarioEntity) {
    when(() => repository.listAll())
        .thenAnswer((_) async => Right(usuarioEntityInitial));
  }

  group('Listar Usuarios : ', () {
    test('Deve retornar um objeto do tipo Lista de UsuarioEntity como sucesso',
        () async {
      setWhenSuccess(usuarioEntityInitial);

      final result = await usuarioListUsecase(NoParams());

      result.fold((l) => null, (r){

          expect(r, usuarioEntityInitial);
      });

    });

    // test('Deve retornar uma ServerFailure caso a aconteça um erro', () async {
    //   when(() => repository.listTopic('')).thenAnswer((_) async =>
    //       Left(ServerFailure(error: ErrorResponsePixEnum.timeout)));

    //   final result = await faqPixListUsecase('');

    //   result.fold(
    //       onLeft: (l) {
    //         expect(l, isA<IFailure>());
    //       },
    //       onRight: (r) => r);
    //   verify(() => repository.listTopic('')).called(1);
    // });
  });
}