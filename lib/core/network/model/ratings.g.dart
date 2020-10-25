// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings(
    json['id'] as int,
    json['title'] as String,
    json['count'] as int,
    (json['percent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'count': instance.count,
      'percent': instance.percent,
    };
