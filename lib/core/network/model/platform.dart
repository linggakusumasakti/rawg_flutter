import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'platform.g.dart';

@JsonSerializable()
class Platform extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  final String image;

  String getImage() {
    switch (id) {
      case 1:
        return "images/windows.png";
        break;
      case 2:
        return "images/playstation.png";
        break;
      case 3:
        return "images/xbox.png";
        break;
      case 4:
        return "images/ios.png";
        break;
      case 5:
        return "images/apple.png";
        break;
      case 6:
        return "images/linux.png";
        break;
      case 7:
        return 'images/nintendo.png';
        break;
      case 8:
        return 'images/android.png';
        break;
      default:
        return 'images/android.png';
        break;
    }
  }

  Platform(this.id, this.name, this.image);

  @override
  List<Object> get props => [id, name, image];

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformToJson(this);
}
