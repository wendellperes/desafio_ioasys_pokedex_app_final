import 'package:equatable/equatable.dart';

import '../../../../consts/globalString_empty.dart';

class PokemonEntity extends Equatable {
  const PokemonEntity({
    this.name,
    this.url,
  });

  factory PokemonEntity.empty() => const PokemonEntity(
        name: GlobalConstants.emptyString,
        url: GlobalConstants.emptyString,
      );
  factory PokemonEntity.fromEntity(PokemonEntity entity) => PokemonEntity(
        name: entity.name,
        url: entity.url,
      );

  final String? name;
  final String? url;

  String _getId() {
    String id = url!.substring(34, url!.length - 1);
    return id;
  }

  String get idPokemon => _getId();

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
