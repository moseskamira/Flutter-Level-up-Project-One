import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myFlutterApp/models/api_response.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/service/user_service.dart';

class UserProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  UserService get userHelper => GetIt.I<UserService>();
  var users = [];
  var singleUser;

  UserProvider.initializeUsersList();

  GlobalKey<FormState> get formKey => _formKey;

  void loadUsers() async {
    APIResponse<List<User>> responseData = await userHelper.getUsers();
    if (responseData.error == false) {
      users = responseData.data.toList();
      notifyListeners();
    } else {
      print(responseData.errorMessage);
    }
  }

  void loadSingleUser({String name}) async {
    APIResponse<User> responseData =
        await userHelper.getUserByUserName(userName: name);
    if (responseData.error == false) {
      singleUser = responseData.data;
      notifyListeners();
    } else {
      print(responseData.errorMessage);
    }
  }
}
