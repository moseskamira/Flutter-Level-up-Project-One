import 'package:flutter_test/flutter_test.dart';
import 'package:myFlutterApp/util/form_input_validations.dart';

void main() {
  group('Form Input Validations', () {
    test('Empty EmailFormField returns an Error', () {
      final validationResult = EmailValidator.validateEmail('');
      expect(validationResult, 'userEmail Required !');
    });

    test('Invalid Email returns an Error', () {
      final validationResult = EmailValidator.validateEmail('moses.com');
      expect(validationResult, 'Enter Valid Email Address !');
    });

    test('Empty PasswordFormField returns an Error', () {
      final validationResult = PasswordValidator.validatePassword('');
      expect(validationResult, 'Password Required !');
    });

    test('Minimum Password length returns an Error', () {
      final validationResult = PasswordValidator.validatePassword('mosK');
      expect(validationResult, 'Minimum Password length is 5');
    });

    test('IEmpty Username field returns an Error', () {
      final validationResult = UserNameValidator.validateUserName('');
      expect(validationResult, 'UserName Required!');
    });

    test('Username characters less than 3 returns an Error', () {
      final validationResult = UserNameValidator.validateUserName('mo');
      expect(
          validationResult, 'Acceptable minimum number of characters is: 3 !');
    });
  });
}
