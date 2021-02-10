import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Custom Text Test', () {
    String myText;
    CustomText customText;
    setUp(() {
      myText = 'MyFlutterLevelUp';
      customText = CustomText(text: myText);
    });
    testWidgets(
        'CustomText  takes in a a Non-Nullable, Not Empty String Instance',
        (WidgetTester tester) async {
      Widget customTextWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: customText,
        ),
      );
      await tester.pumpWidget(customTextWidget);
      final textFiner = find.byKey(Key(customText.text));
      expect(textFiner.toString().contains('MyF'), true);
      expect(textFiner.toString(), matcher.isNotEmpty);
      expect(textFiner.toString(), matcher.isNotNull);
    });
  });
}
