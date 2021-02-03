import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api/app_urls.dart';
import '../models/api_response.dart';
import '../models/user_model.dart';

class UserService {
  var client = http.Client();
  List<User> usersList = [];

  static String getUsersPath() => AppUrls.baseUrl + AppUrls.usersUrl;

  static String getSingleUserPAth() => AppUrls.baseUrl + AppUrls.singleUserUrl;

  static Map<String, String> getHeader() => {
        "Accept": "application/json",
        "Key": "",
      };

  Future<APIResponse<List<User>>> getUsers() async => await client
          .get(
        Uri.encodeFull(getUsersPath()),
        headers: getHeader(),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            final jsonString = response.body;
            final jsonMap = jsonDecode(jsonString)['items'];

            print(jsonMap.toString());
            for (var singleItem in jsonMap) {
              usersList.add(User.fromJsonConverter(singleItem));
              // usersList = jsonDataList.map((user) => User.fromJsonConverter(user)).toList();
            }
            return APIResponse<List<User>>(
              data: usersList,
            );
          } else {
            return APIResponse<List<User>>(
                error: true, errorMessage: 'An Error Occurred');
          }
        },
      ).catchError(
        (_) => APIResponse<List<User>>(
            error: true,
            errorMessage: 'An Error Occurred While Fetching Users'),
      );

  Future<APIResponse<User>> getUserByUserName(
          {@required String userName}) async =>
      await client.get(Uri.encodeFull(getSingleUserPAth() + userName)).then(
        (userResp) {
          if (userResp.statusCode == 200) {
            final jsonString = userResp.body;
            final jsonMap = jsonDecode(jsonString);
            User user = User.fromJsonConverter(jsonMap);
            print(user);
            return APIResponse<User>(
              data: user,
            );
          } else {
            return APIResponse<User>(
                error: true, errorMessage: 'An Error Occurred');
          }
        },
      ).catchError(
        (_) => APIResponse<User>(
            error: true,
            errorMessage: 'An Error Occurred While Fetching Users'),
      );

  Future<APIResponse<bool>> saveUser(User userObject) async => await http
          .post(getUsersPath(),
              headers: getHeader(),
              body: jsonEncode(userObject.toJsonConverter()))
          .then((response) {
        if (response.statusCode == 201) {
          return APIResponse<bool>(data: true);
        } else {
          return APIResponse<bool>(
              error: true, errorMessage: 'An Error Occurred');
        }
      }).catchError(
        (_) => APIResponse<bool>(
            error: true,
            errorMessage: 'An Error Occurred While Fetching Users'),
      );
}
