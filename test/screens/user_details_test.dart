import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:matcher/matcher.dart' as matcher;
import 'package:myFlutterApp/widgets/user_details_widget.dart';

void main() {
  group('UserDetailsWidget Test', () {
    User detailedUser;
    UserDetailsWidget userDetailsWidget;
    setUp(() {
      detailedUser = User(
          userName: 'Moses Kamira',
          profileImage: 'https://avatars.githubusercontent.com/u/42971167?v=4',
          profileUrl: 'https:moseskt.com',
          userType: 'user');
      userDetailsWidget = UserDetailsWidget(user: detailedUser);
    });

    testWidgets('UserDetailsWidget  takes in a User Instance, displays the details of that user',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        Widget testWidget = MediaQuery(
          data: new MediaQueryData(),
          child: new MaterialApp(
            home: userDetailsWidget,
          ),
        );
        await tester.pumpWidget(testWidget);
        final userFiner = find.byKey(Key(userDetailsWidget.user.userName));
        expect(userFiner.toString(), matcher.contains('Moses'));
      });
    });
  });
}
