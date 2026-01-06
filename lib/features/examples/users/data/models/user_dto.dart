import 'package:json_annotation/json_annotation.dart';
import '../../domain/models/user.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    required this.name,
    required this.email,
    required this.phone,
    required this.login,
    required this.picture,
    required this.location,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  final NameDto name;
  final String email;
  final String phone;
  final LoginDto login;
  final PictureDto picture;
  final LocationDto location;

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  User toDomain() {
    return User(
      id: login.uuid,
      firstName: name.first,
      lastName: name.last,
      email: email,
      phone: phone,
      largeAvatarUrl: picture.large,
      country: location.country,
    );
  }
}

@JsonSerializable()
class NameDto {
  NameDto({
    required this.title,
    required this.first,
    required this.last,
  });

  factory NameDto.fromJson(Map<String, dynamic> json) =>
      _$NameDtoFromJson(json);

  final String title;
  final String first;
  final String last;

  Map<String, dynamic> toJson() => _$NameDtoToJson(this);
}

@JsonSerializable()
class LoginDto {
  LoginDto({
    required this.uuid,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  final String uuid;

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}

@JsonSerializable()
class PictureDto {
  PictureDto({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory PictureDto.fromJson(Map<String, dynamic> json) =>
      _$PictureDtoFromJson(json);

  final String large;
  final String medium;
  final String thumbnail;

  Map<String, dynamic> toJson() => _$PictureDtoToJson(this);
}

@JsonSerializable()
class LocationDto {
  LocationDto({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  final String city;
  final String state;
  final String country;
  final dynamic postcode;

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
