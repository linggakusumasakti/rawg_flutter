import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

  Color getColor() {
    switch (id) {
      case 5:
        return Colors.green;
        break;
      case 4:
        return Colors.blue;
        break;
      case 3:
        return Colors.orange;
        break;
      default:
        return Colors.red;
        break;
    }
  }

  Ratings(this.id, this.name, this.count, this.percent);

  @override
  List<Object> get props => [id, name, count, percent];

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
