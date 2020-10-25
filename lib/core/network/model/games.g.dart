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
    json['released'] as String,
    (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['short_screenshots'] as List)
        ?.map((e) => e == null
            ? null
            : ShortScreenShots.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['ratings'] as List)
        ?.map((e) =>
            e == null ? null : Ratings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['ratings_count'] as int,
  );
}

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'metacritic': instance.metacritic,
      'released': instance.released,
      'parent_platforms': instance.parentPlatform,
      'genres': instance.genres,
      'short_screenshots': instance.shortScreenshots,
      'ratings': instance.ratings,
      'ratings_count': instance.ratingsCount,
    };
