import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  final String id;

  @JsonKey(name: 'employee_name')
  final String userName;

  @JsonKey(name: 'employee_salary')
  final String userSalary;

  @JsonKey(name: 'employee_age')
  final String userAge;

  @JsonKey(name: 'profile_image')
  final String profileImage;

  User(
      this.id, this.userName, this.userSalary, this.userAge, this.profileImage);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userName = json['employee_name'],
        userSalary = json['employee_salary'],
        userAge = json['employee_age'],
        profileImage = json['profile_image'];
}
