class AppValidator {
  AppValidator._();

  static String? validateRequired(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return 'this field is required';
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    }

    if (value.length < 8) {
      return 'password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'password must contain at least one capital letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'password must contain at least one number';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>\[\]\\/\-_=+;`~]').hasMatch(value)) {
      return 'password must contain at least one special character';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'this field is required';
    }

    if (confirmPassword != password) {
      return 'password does not match';
    }

    return null;
  }
}
