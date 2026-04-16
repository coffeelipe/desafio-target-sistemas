class RegistrationValidationError {
  RegistrationValidationError._();

  static const Map<UsernameValidationErrors, String> usernameErrorMessages = {
    UsernameValidationErrors.insufficientCharacters:
        'Deve conter no mínimo 3 caracteres',
    UsernameValidationErrors.invalidCharacters:
        'Apenas letras, números, hífens e underlines são permitidos',
    UsernameValidationErrors.containsSpace: 'Não deve conter espaços',
    UsernameValidationErrors.startsWithNumber: 'Não deve começar com um número',
    UsernameValidationErrors.sequentialNonAlfaNumeric:
        'Não deve conter hífens ou underlines em sequência',
    UsernameValidationErrors.invalidStartOrEnd:
        'Não deve começar ou terminar em caracteres especiais',
  };
}

class GlobalValidationError {
  GlobalValidationError._();

  static const String emptyFieldErrorMessage = 'Este campo é obrigatório';
}

enum UsernameValidationErrors {
  insufficientCharacters,
  invalidCharacters,
  containsSpace,
  startsWithNumber,
  sequentialNonAlfaNumeric,
  invalidStartOrEnd,
}
