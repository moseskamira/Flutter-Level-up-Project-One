import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myFlutterApp/models/user_model.dart';

class UserHelper {
  static const url = "https://api.github.com/";

  String getPath() {
    return url + "search/users?q=type:User+location:Kampala+language:JAVA";
  }

  Future<List<User>> getUsers() async =>
      await http.get(getPath()).then((result) {
        if (result.statusCode == 200) {
          var json = jsonDecode(result.body);
          List jsonDataList = json['items'];
          print(jsonDataList.toString());
          return jsonDataList.map((users) => User.fromJson(users)).toList();
        } else {
          throw Exception('Failed To Fetch Data');
        }
      });
// .catchError(onError);
}
