import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';

void main() {
  group('Custom Text Test', () {
    String myText;
    setUp(() {
      myText = 'MyFlutterLevelUp';
    });
    testWidgets(
        'CustomText  takes in a a Non-Nullable, Not Empty String Instance',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CustomText(text: myText),
        ),
      );
      expect(find.text(myText), findsOneWidget);
    });
  });
}
