class ValidatorUtil {
  ValidatorUtil._();

  static final RegExp _passwordRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$');

  static bool isValidPassword(String password) {
    if (!_passwordRegex.hasMatch(password)) return false;
    if (_hasSequential(password, length: 4)) return false;
    if (_hasRepeated(password, length: 4)) return false;
    return true;
  }

  /// Check sequential characters (e.g., abcd, 1234)
  static bool _hasSequential(String input, {int length = 4}) {
    for (int i = 0; i <= input.length - length; i++) {
      bool isSequential = true;

      for (int j = 1; j < length; j++) {
        if (input.codeUnitAt(i + j) != input.codeUnitAt(i + j - 1) + 1) {
          isSequential = false;
          break;
        }
      }

      if (isSequential) return true;
    }
    return false;
  }

  /// Check repeated characters (e.g., aaaa, 1111)
  static bool _hasRepeated(String input, {int length = 4}) {
    for (int i = 0; i <= input.length - length; i++) {
      final firstChar = input[i];
      bool isRepeated = true;

      for (int j = 1; j < length; j++) {
        if (input[i + j] != firstChar) {
          isRepeated = false;
          break;
        }
      }

      if (isRepeated) return true;
    }
    return false;
  }
}
