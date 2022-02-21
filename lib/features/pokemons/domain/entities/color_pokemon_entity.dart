import 'package:equatable/equatable.dart';
import 'package:pekedex_ioasys/features/pokemons/data/models/color_pokemon_model.dart';

import '../../../../consts/globalString_empty.dart';

class ColorsEntity extends Equatable {
  const ColorsEntity({
    required this.name,
    required this.url,
  });

  factory ColorsEntity.empty() => const ColorsEntity(
        name: GlobalConstants.emptyString,
        url: GlobalConstants.emptyString,
      );

  factory ColorsEntity.fromEntity(ColorModel model) => ColorsEntity(
        name: model.name,
        url: model.url,
      );
  final String? name;
  final String? url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
