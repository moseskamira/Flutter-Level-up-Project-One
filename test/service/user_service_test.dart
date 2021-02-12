import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('User Service Test', () {
    List<User> usersList = [];
    test(
      'Returns a list of users',
      () async {
        final file = File('test_resource/users_list.json');
        final jsonString = await file.readAsString();
        final jsonMap = json.decode(jsonString)['items'];
        for (final juser in jsonMap) {
          User user = User.fromJsonConverter(juser);
          usersList.add(user);
        }
        expect(usersList, isNotEmpty);
        expect(usersList[0].userName, matcher.equals('jokamjohn'));
      },
    );

    test(
      'Returns a single user by username',
      () async {
        final file = File('test_resource/user.json');
        final jsonString = await file.readAsString();
        final jsonMap = json.decode(jsonString);
        User user = User.fromJsonConverter(jsonMap);
        print(user.id);
        expect(user, matcher.TypeMatcher<User>());
        expect(user.id, 42971167);
      },
    );
  });
}
