// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Platform _$PlatformFromJson(Map<String, dynamic> json) {
  return Platform(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$PlatformToJson(Platform instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
