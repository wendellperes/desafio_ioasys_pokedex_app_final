import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pokemon_entity.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultsModel extends Equatable {
  const ResultsModel({
    this.name,
    this.url,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsModelToJson(this);

  factory ResultsModel.fromModel(ResultsModel resultsModel) => ResultsModel(
        name: resultsModel.name,
        url: resultsModel.url,
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
