// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      profileImage: json['avatar_url'] as String?,
      profileUrl: json['url'] as String?,
      userName: json['login'] as String?,
      userType: json['type'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.userName,
      'url': instance.profileUrl,
      'avatar_url': instance.profileImage,
      'type': instance.userType,
    };
