import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myFlutterApp/models/user_model.dart';

class UserHelper {
  List<User> usersList = [];

  Future<List<User>> getUsers({@required String urlEndPoint}) async =>
      await http.get(urlEndPoint).then((result) {
        if (result.statusCode == 200) {
          List jsonDataList = jsonDecode(result.body)['items'];
          print(jsonDataList.toString());
          usersList =
              jsonDataList.map((user) => User.fromJsonConverter(user)).toList();
          return usersList;
        } else {
          return usersList;
        }
      });

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
          throw Exception('Failed to create album.');
        }
      });
}
