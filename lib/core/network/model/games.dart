import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'games.g.dart';

@JsonSerializable()
class Result extends Equatable {
  @JsonKey(name: 'results')
  final List<Games> results;

  const Result([this.results = const []]);

  @override
  List<Object> get props => [results];

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Games extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'background_image')
  final String backgroundImage;

  @JsonKey(name: 'metacritic')
  final int metacritic;

  Games(this.id, this.name, this.backgroundImage, this.metacritic);

  @override
  List<Object> get props => [id, name, backgroundImage];

  factory Games.fromJson(Map<String, dynamic> json) => _$GamesFromJson(json);

  Map<String, dynamic> toJson() => _$GamesToJson(this);
}
