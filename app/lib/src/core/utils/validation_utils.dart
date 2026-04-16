import 'package:app/src/core/error/validation_errors.dart';

class ValidationUtils {
  static String computeErrorMessage(FieldType fieldType, String? value) {
    if (value == null || value.isEmpty) return GlobalValidationError.emptyFieldErrorMessage;
    switch (fieldType) {
      case FieldType.username:
        return _computeUsernameErrorMessage(value);
      default:
        return 'Algo deu errado';
    }
  }

  static String _computeUsernameErrorMessage(String value) {
    if (value.length < 3) {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors
          .insufficientCharacters]!;
    } else if (RegExp(r'\s').hasMatch(value)) {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors.containsSpace]!;
    } else if (RegExp(r'[^a-zA-Z0-9_-]').hasMatch(value)) {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors.invalidCharacters]!;
    } else if (RegExp(r'^[0-9]').hasMatch(value)) {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors.startsWithNumber]!;
    } else if (RegExp(r'([-_]{2,})').hasMatch(value)) {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors
          .sequentialNonAlfaNumeric]!;
    } else {
      return RegistrationValidationError
          .usernameErrorMessages[UsernameValidationErrors.invalidStartOrEnd]!;
    }
  }
}

enum FieldType { username, email, password }
