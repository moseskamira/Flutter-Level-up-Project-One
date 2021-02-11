import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/screens/my_home_page.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';

void main() {
  group('Home Page Test', () {
    testWidgets('MyWidget has a title and message',
        (WidgetTester tester) async {
      Widget testHomeWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: MyHomePage(),
        ),
      );
      await tester.pumpWidget(testHomeWidget);
      expect(find.widgetWithText(PageTitleText, 'U.M.S'), findsOneWidget);
      expect(find.widgetWithText(CustomText, 'USER REG FORM'), findsOneWidget);
      expect(find.widgetWithText(RaisedButton, 'SUBMIT'), findsOneWidget);
    });
  });
}
