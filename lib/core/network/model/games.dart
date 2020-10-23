import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_flutter/core/network/model/genres.dart';
import 'package:rawg_flutter/core/network/model/parent_platform.dart';

part 'games.g.dart';

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

  @JsonKey(name: 'released')
  final String released;

  @JsonKey(name: 'parent_platforms')
  final List<ParentPlatform> parentPlatform;

  @JsonKey(name: 'genres')
  final List<Genres> genres;

  String getDate() {
    DateFormat dateFormat = DateFormat('MMM dd, yyyy');
    DateTime dateTime = DateTime.parse(released);
    return dateFormat.format(dateTime);
  }

  Games(this.id, this.name, this.backgroundImage, this.metacritic,
      this.parentPlatform, this.released, this.genres);

  @override
  List<Object> get props => [id, name, backgroundImage];

  factory Games.fromJson(Map<String, dynamic> json) => _$GamesFromJson(json);

  Map<String, dynamic> toJson() => _$GamesToJson(this);
}
