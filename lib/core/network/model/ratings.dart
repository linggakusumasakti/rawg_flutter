import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String name;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'percent')
  final double percent;

  Ratings(this.id, this.name, this.count, this.percent);

  @override
  List<Object> get props => [id, name, count, percent];

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
