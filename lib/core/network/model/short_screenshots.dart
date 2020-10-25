import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'short_screenshots.g.dart';

@JsonSerializable()
class ShortScreenShots extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'image')
  final String image;

  String getImageView() {
    String url = "";
    if (id != -1) url = image;
    return url;
  }

  ShortScreenShots(this.id, this.image);

  @override
  List<Object> get props => [id, image];

  factory ShortScreenShots.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenShotsFromJson(json);

  Map<String, dynamic> toJson() => _$ShortScreenShotsToJson(this);
}
