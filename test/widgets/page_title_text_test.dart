import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('PageTitleText Test', () {
    PageTitleText pageTitleText;
    setUp(() {
      pageTitleText =
          PageTitleText(titleText: 'New App', textColor: Colors.black);
    });
    testWidgets('PageTitleText widget is loaded with a Text',
        (WidgetTester tester) async {
      Widget pageTitleTextWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: pageTitleText,
        ),
      );
      await tester.pumpWidget(pageTitleTextWidget);

      final widgetFinder = find.text(pageTitleText.titleText);
      expect(widgetFinder, matcher.isNotNull);
      expect(widgetFinder, findsOneWidget);
    });
  });
}
