import 'package:equatable/equatable.dart';

class UsuarioEntity extends Equatable {
  const UsuarioEntity({
    required this.name,
    required this.email,
    required this.nascimento,
    required this.sexo
  });

  factory UsuarioEntity.empty() => const UsuarioEntity(
        email: '',
        name: '',
        nascimento: '',
        sexo: ''
      );
  final String name;
  final String email;
  final String nascimento;
  final String sexo;

  @override
  List<Object?> get props => [
        name,
        email,
        nascimento,
        sexo
      ];
}
