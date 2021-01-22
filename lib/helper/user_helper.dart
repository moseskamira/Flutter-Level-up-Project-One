import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myFlutterApp/models/user_model.dart';

class UserHelper {
  List<User> usersList = [];

  Future<List<User>> getUsers(String url) async =>
      await http.get(url).then((result) {
        if (result.statusCode == 200) {
          List jsonDataList = jsonDecode(result.body)['items'];
          print(jsonDataList.toString());
          usersList = jsonDataList.map((user) => User.fromJsonConverter(user)).toList();
          return usersList;
        } else {
          return usersList;
        }
      });
}
