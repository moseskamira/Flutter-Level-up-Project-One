import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/screens/my_home_page.dart';
import 'package:myFlutterApp/util/form_input_validations.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';

void main() {
  group('Home Page Test', () {
    testWidgets('MyWidget has a title and message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MyHomePage(),
        ),
      );
      final floatingButton = find.byIcon(Icons.add);
      expect(find.widgetWithText(PageTitleText, 'U.M.S'), findsOneWidget);
      expect(find.widgetWithText(CustomText, 'USER REG FORM'), findsOneWidget);
      expect(find.byType(RaisedButton), findsOneWidget);
      expect(floatingButton, findsOneWidget);
      await tester.tap(floatingButton);
      await tester.pump();
      expect(find.text('USER REG FORM'), findsOneWidget);
    });
    test('Empty username field returns an error', () {
      final result = UserNameValidator.validateUserName('');
      expect(result, 'UserName Required!');
    });
    test('Username length less than 3 returns an error', () {
      final result = UserNameValidator.validateUserName('Mk');
      expect(result, 'Acceptable minimum number of characters is: 3 !');
    });
    test('Empty Password field returns an error', () {
      final result = PasswordValidator.validatePassword('');
      expect(result, 'Password Required !');
    });
    test('Password length less than 5 returns an error', () {
      final result = PasswordValidator.validatePassword('MK12');
      expect(result, 'Minimum Password length is 5');
    });
    test('Empty Email field returns an error', () {
      final result = EmailValidator.validateEmail('');
      expect(result, 'userEmail Required !');
    });
    test('Invalid Email returns an error', () {
      final result = EmailValidator.validateEmail('mk.com');
      expect(result, 'Enter Valid Email Address !');
    });
  });
}
