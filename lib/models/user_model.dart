import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int? id;

  @JsonKey(name: 'login')
  String? userName;

  @JsonKey(name: 'url')
  String? profileUrl;

  @JsonKey(name: 'avatar_url')
  String? profileImage;

  @JsonKey(name: 'type')
  String? userType;

  User(
      {this.id,
      this.profileImage,
      this.profileUrl,
      this.userName,
      this.userType});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
