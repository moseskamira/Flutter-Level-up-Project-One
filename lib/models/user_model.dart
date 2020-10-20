import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  final int id;

  @JsonKey(name: 'login')
  final String userName;

  @JsonKey(name: 'url')
  final String profileUrl;

  @JsonKey(name: 'avatar_url')
  final String profileImage;

  @JsonKey(name: 'type')
  final String userType;


  User(
      this.id, this.userName, this.profileUrl, this.profileImage, this.userType);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userName = json['login'],
        profileUrl = json['url'],
        profileImage = json['avatar_url'],
        userType = json['type'];
}
