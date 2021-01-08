import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myFlutterApp/models/user_model.dart';

class UserHelper {
  Future<List<User>> getUsers(String urlString) async =>
      await http.get(urlString).then((result) {
        if (result.statusCode == 200) {
          var json = jsonDecode(result.body);
          List jsonDataList = json['items'];
          print(jsonDataList.toString());
          return jsonDataList.map((users) => User.fromJson(users)).toList();
        } else {
          throw Exception('Failed To Fetch Data');
        }
      });
}
