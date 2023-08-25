class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'userEmail Required !';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Enter Valid Email Address !';
    }
    return null;
  }
}

class UserNameValidator {
  static String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'UserName Required!';
    } else if (value.length < 3) {
      return 'Acceptable minimum number of characters is: 3 !';
    }
    return null;
  }
}

class PasswordValidator {
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password Required !';
    } else if (value.length < 5) {
      return 'Minimum Password length is 5';
    }
    return null;
  }
}
