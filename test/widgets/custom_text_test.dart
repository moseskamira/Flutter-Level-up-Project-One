import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Custom Text Test', () {
    test('Empty string passed', () {
      // Arrange
      var customText = CustomText(
        text: '',
      );
      // Assert
      expect(customText.text, matcher.isEmpty);
    });

    test('Value should not be Empty nor Null', () {
      // Arrange
      var titleText = 'My Flutter App';
      var customText = CustomText(
        text: titleText,
      );
      // Assert
      expect(customText.text, matcher.isNotEmpty);
      expect(customText.text, matcher.isNotNull);
    });

    test('Value should be as passed', () {
      // Arrange
      var titleText = 'My Flutter App';
      var customText = CustomText(
        text: titleText,
      );
      // Assert
      expect(customText.text, titleText);
    });

    test('Null value provided', () {
      // Arrange
      var titleText;
      var customText = CustomText(
        text: titleText,
      );
      // Assert
      expect(customText.text, matcher.isNull);
    });
  });
}
