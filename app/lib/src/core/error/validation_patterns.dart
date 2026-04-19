class ValidationPatterns {
  ValidationPatterns._();

  static final RegExp usernameRegex = RegExp(
    r'^(?=.{3,16}$)[A-Za-z](?:[A-Za-z0-9]|[-_](?=[A-Za-z0-9]))*$',
  );
  static final RegExp passwordRegex = RegExp(
    r'^(?=.{6,})[a-zA-Z0-9!@#$%^&*]+$',
  );
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp emojiRegex = RegExp(
    r'([\u2700-\u27BF]|[\uE000-\uF8FF]|\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|[\u2011-\u26FF]|\uD83E[\uDD10-\uDDFF])',
  );
}
