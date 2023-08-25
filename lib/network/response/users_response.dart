import 'package:json_annotation/json_annotation.dart';
import 'package:myFlutterApp/models/user_model.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  @JsonKey(name: 'total_count')
  int? totalCount;

  List<User>? items;

  UsersResponse({this.totalCount, this.items});

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
