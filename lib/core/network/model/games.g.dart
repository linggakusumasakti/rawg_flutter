// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Games _$GamesFromJson(Map<String, dynamic> json) {
  return Games(
    json['id'] as int,
    json['name'] as String,
    json['background_image'] as String,
    json['metacritic'] as int,
    (json['parent_platforms'] as List)
        ?.map((e) => e == null
            ? null
            : ParentPlatform.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'metacritic': instance.metacritic,
      'parent_platforms': instance.parentPlatform,
    };
