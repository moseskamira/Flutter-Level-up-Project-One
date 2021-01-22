import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myFlutterApp/helper/user_helper.dart';
import 'package:myFlutterApp/models/user_model.dart';

class UserProvider with ChangeNotifier {
  static const url = "https://api.github.com/";

  String getPath() {
    return url + "search/users?q=type:User+location:Kampala+language:JAVA";
  }
  UserHelper userHelper = UserHelper();
  List<User> users = [];

  UserProvider.initializeUsersList() {
    _loadUsers();
  }

  void _loadUsers() async {
    try {
      users = await userHelper.getUsers(getPath());
      users = await userHelper.getUsers();
      notifyListeners();
    } catch (e) {
      notifyListeners();
      print('ERROR: '+e.toString());
    }
  }
}
