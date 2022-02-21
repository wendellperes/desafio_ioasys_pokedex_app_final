import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pekedex_ioasys/consts/globalString_empty.dart';

import '../../domain/entities/pokemon_entity.dart';

part 'color_pokemon_model.g.dart';

@JsonSerializable()
class ColorModel extends Equatable {
  const ColorModel({
    this.name,
    this.url,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);

  factory ColorModel.fromModel(ColorModel resultsModel) => ColorModel(
        name: resultsModel.name,
        url: resultsModel.url,
      );
  factory ColorModel.empty() => const ColorModel(
        name: GlobalConstants.emptyString,
        url: GlobalConstants.emptyString,
      );
  PokemonEntity get entity => PokemonEntity(
        name: name,
        url: url,
      );

  final String? name;
  final String? url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
