
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myFlutterApp/helper/user_helper.dart';
import 'package:myFlutterApp/models/user_model.dart';

class UserProvider with ChangeNotifier{

  UserHelper userHelper = UserHelper();
  List<User> users = [];

  UserProvider.initializeUsersList() {
    _loadUsers();
  }

  void _loadUsers() async{
    users = await userHelper.getUsers();
    notifyListeners();
  }

}
