import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/screens/my_home_page.dart';
import 'package:myFlutterApp/util/form_input_validations.dart';
import 'package:myFlutterApp/util/make_testable.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';

void main() {
  group('MyHomePage Widget Test', () {
    testWidgets(
      'Given MyWidget is pumped When a pumpWidget() method is invoked Then some expectations are true',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MakeTestable.returnTestableWidget(MyHomePage()),
        );
        Finder floatingButtonFinder = find.byIcon(Icons.add);
        Finder submitBtnFinder = find.byKey(Key('submitKey'));
        Finder userForm = find.byType(Form);

        expect(find.widgetWithText(PageTitleText, 'U.M.S'), findsOneWidget);
        expect(submitBtnFinder, findsOneWidget);
        expect(floatingButtonFinder, findsOneWidget);
        expect(userForm, findsOneWidget);

        await tester.tap(floatingButtonFinder);
        await tester.pump();
        expect(
            find.widgetWithText(CustomText, 'USER REG FORM'), findsOneWidget);
      },
    );
    test(
        '''''Given username field is empty When user taps on Submit button Then an error message is returned''',
        () {
      final result = UserNameValidator.validateUserName('');
      expect(result, 'UserName Required!');
    });
    test(
        'Given Username length less than 3 When a user taps Submit button Then an error message is returned',
        () {
      final result = UserNameValidator.validateUserName('Mk');
      expect(result, 'Acceptable minimum number of characters is: 3 !');
    });
    test(
        'Given Password field is empty When user taps Submit button Then an error message is returned',
        () {
      final result = PasswordValidator.validatePassword('');
      expect(result, 'Password Required !');
    });
    test(
        'Given Password length less than 5 When a user taps Submit button Then an error message is returned',
        () {
      final result = PasswordValidator.validatePassword('MK12');
      expect(result, 'Minimum Password length is 5');
    });
    test(
        'Given Email field is empty When a user taps Submit button Then an error message is returned',
        () {
      final result = EmailValidator.validateEmail('');
      expect(result, 'userEmail Required !');
    });
    test(
        'Given an 1nvalid Email is entered When a user taps Submit button Then an error message is returned',
        () {
      final result = EmailValidator.validateEmail('mk.com');
      expect(result, 'Enter Valid Email Address !');
    });
  });
}
