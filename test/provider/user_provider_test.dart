import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/models/api_response.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/service/user_service.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('UserProvider Test', () {
    User user;
    List<User> usersList;
    setUp(() {
      user = User(
        userName: 'Moses Kamira',
        profileImage: 'https://avatars.githubusercontent.com/u/42971167?v=4',
        profileUrl: 'https:moseskt.com',
        userType: 'user',
      );
      usersList = [];
    });

    test('Returns single user When username is passed', () async {
      UserService userService = UserService();
      APIResponse<User> responseData =
          await userService.getUserByUserName(userName: 'moseskamira');
      if (responseData.error = false) {
        expect(responseData.data, matcher.TypeMatcher<User>());
        expect(responseData.data, user);
      }
    });

    test('Returns a list of users', () async {
      UserService userService = UserService();
      APIResponse<List<User>> responseData = await userService.getUsers();
      if (responseData.error = false) {
        expect(responseData.data, matcher.TypeMatcher<List<User>>());
        expect(responseData.data, matcher.contains(user));
      }
    });
    tearDown(() {
      usersList.clear();
    });
  });
}
