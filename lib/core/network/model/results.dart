import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'games.dart';

part 'results.g.dart';

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