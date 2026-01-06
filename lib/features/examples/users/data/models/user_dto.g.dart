// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  name: NameDto.fromJson(json['name'] as Map<String, dynamic>),
  email: json['email'] as String,
  phone: json['phone'] as String,
  login: LoginDto.fromJson(json['login'] as Map<String, dynamic>),
  picture: PictureDto.fromJson(json['picture'] as Map<String, dynamic>),
  location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'login': instance.login,
  'picture': instance.picture,
  'location': instance.location,
};

NameDto _$NameDtoFromJson(Map<String, dynamic> json) => NameDto(
  title: json['title'] as String,
  first: json['first'] as String,
  last: json['last'] as String,
);

Map<String, dynamic> _$NameDtoToJson(NameDto instance) => <String, dynamic>{
  'title': instance.title,
  'first': instance.first,
  'last': instance.last,
};

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) =>
    LoginDto(uuid: json['uuid'] as String);

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
  'uuid': instance.uuid,
};

PictureDto _$PictureDtoFromJson(Map<String, dynamic> json) => PictureDto(
  large: json['large'] as String,
  medium: json['medium'] as String,
  thumbnail: json['thumbnail'] as String,
);

Map<String, dynamic> _$PictureDtoToJson(PictureDto instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  postcode: json['postcode'],
);

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
    };
