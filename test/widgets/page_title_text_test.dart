import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/util/make_testable.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('PageTitleText Test', () {
    testWidgets('PageTitleText widget is loaded with a Text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MakeTestable.returnTestableWidget(
          PageTitleText(
            titleText: 'New App',
            textColor: Colors.black,
          ),
        ),
      );

      final widgetFinder = find.text('New App');
      expect(widgetFinder, matcher.isNotNull);
      expect(widgetFinder, findsOneWidget);
    });
  });
}
