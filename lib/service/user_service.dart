import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myFlutterApp/models/api_response.dart';
import 'package:myFlutterApp/models/user_model.dart';

class UserService {
  List<User> usersList = [];

  Future<APIResponse<List<User>>> getUsers(
          {@required String urlEndPoint}) async =>
      await http.get(urlEndPoint).then(
        (response) {
          if (response.statusCode == 200) {
            List jsonDataList = jsonDecode(response.body)['items'];
            print(jsonDataList.toString());
            usersList = jsonDataList
                .map((user) => User.fromJsonConverter(user))
                .toList();
            return APIResponse<List<User>>(
              data: usersList,
            );
          } else {
            return APIResponse<List<User>>(
                error: true, errorMessage: 'An Error Occurred');
          }
        },
      );

  Future<String> saveUser({
    @required User userObject,
    @required String urlEndPoint,
    @required Map<String, dynamic> regHeader,
  }) async =>
      await http
          .post(
        urlEndPoint,
        headers: regHeader,
        body: jsonEncode(<String, dynamic>{
          User.USERNAME: userObject.userName,
          User.PROFILEIMAGE: userObject.profileImage,
          User.USERTYPE: userObject.userType,
          User.PROFILEURL: userObject.profileUrl,
          User.USERID: userObject.id,
        }),
      )
          .then((response) {
        if (response.statusCode == 201) {
          return response.body;
        } else {
          throw Exception('Failed to create new user.');
        }
      });
}
