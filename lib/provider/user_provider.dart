import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myFlutterApp/helper/user_helper.dart';
import 'package:myFlutterApp/models/user_model.dart';

class UserProvider with ChangeNotifier {
  static const url = "https://api.github.com/";
  final _formKey = GlobalKey<FormState>();

  UserHelper userHelper = UserHelper();
  List<User> users = [];

  UserProvider.initializeUsersList();

  GlobalKey<FormState> get formKey => _formKey;

  static String getPath() {
    return url + "search/users?q=type:User+location:Kampala+language:JAVA";
  }

  static Map<String, String> getRegHeader() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  void loadUsers() async {
    users = await userHelper.getUsers(urlEndPoint: getPath());
    notifyListeners();
  }

  Future<String> postUserData({
    String name,
    int id,
    String image,
    String urlProfile,
    String type,
  }) async {
    User newUser = User(
      id: id,
      userName: name,
      profileUrl: urlProfile,
      profileImage: image,
      userType: type,
    );
    return await userHelper.saveUser(
      userObject: newUser,
      urlEndPoint: getPath(),
      regHeader: getRegHeader(),
    );
  }
}
