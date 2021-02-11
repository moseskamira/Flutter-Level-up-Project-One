import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/screens/user_details.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';

void main() {
  group('DetailScreen Test', () {
    User detailedUser;
    DetailScreen detailScreen;
    setUp(() {
      detailedUser = User(
          userName: 'Moses Kamira',
          profileImage: 'https://avatars.githubusercontent.com/u/42971167?v=4',
          profileUrl: 'https:moseskt.com',
          userType: 'user');
      detailScreen = DetailScreen(detailedUser: detailedUser);
    });

    testWidgets("Displays 'USER DETAILS' text", (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        Widget testWidget = MediaQuery(
          data: new MediaQueryData(),
          child: new MaterialApp(
            home: detailScreen,
          ),
        );
        await tester.pumpWidget(testWidget);
        expect(
          find.widgetWithText(PageTitleText, 'USER DETAILS'),
          findsOneWidget,
        );
      });
    });
  });
}
