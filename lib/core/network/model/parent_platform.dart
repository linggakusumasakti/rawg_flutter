import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rawg_flutter/core/network/model/platform.dart';

part 'parent_platform.g.dart';

@JsonSerializable()
class ParentPlatform extends Equatable {

  @JsonKey(name: 'platform')
  final Platform platform;

  ParentPlatform(this.platform);

  @override
  List<Object> get props => [platform];

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$ParentPlatformToJson(this);
}
