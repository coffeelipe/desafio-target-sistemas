class ValidationPatterns {
  ValidationPatterns._();
  
  static final RegExp usernameRegex = RegExp(
    r'^(?=.{3,16}$)[A-Za-z](?:[A-Za-z0-9]|[-_](?=[A-Za-z0-9]))*$',
  );
}
