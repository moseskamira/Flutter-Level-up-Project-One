import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myFlutterApp/models/api_response.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/service/user_service.dart';

class UserProvider with ChangeNotifier {
  static const url = "https://api.github.com/";
  final _formKey = GlobalKey<FormState>();

  UserService get userHelper => GetIt.I<UserService>();
  List<User> users = [];

  UserProvider.initializeUsersList();

  GlobalKey<FormState> get formKey => _formKey;

  static String getPath() =>
      url + "search/users?q=type:User+location:Kampala+language:JAVA";

  static Map<String, String> getRegHeader() => {
        'Content-Type': 'application/json; charset=UTF-8',
      };

  void loadUsers() async {
    APIResponse<List<User>> responseData = await userHelper.getUsers(urlEndPoint: getPath());
    if(responseData.error == false) {
      users = responseData.data.toList();
      notifyListeners();
    }else{
      print(responseData.errorMessage);
    }

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
