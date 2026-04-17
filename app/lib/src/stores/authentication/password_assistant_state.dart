import 'package:mobx/mobx.dart';
part 'password_assistant_state.g.dart';

// ignore: library_private_types_in_public_api
class PasswordAssistantState = _PasswordAssistantStateBase
    with _$PasswordAssistantState;

abstract class _PasswordAssistantStateBase with Store {
  @observable
  double passwordStrength = 0.05;

  @action
  void evaluatePasswordStrength(
    String password,
    String username,
    String email,
  ) {
    double strength = password.length * 0.1;
    if (password.isEmpty) {
      passwordStrength = 0.05;
      return;
    }

    if (password.length >= 6) strength++;
    if (password.length >= 8) strength++;
    if (RegExp(r'[a-z]').hasMatch(password)) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[!@#$%^&*]').hasMatch(password)) strength += 3;
    if (username.isNotEmpty &&
        password.toLowerCase().contains(username.toLowerCase())) {
      strength -= 3;
    }
    if (email.isNotEmpty) {
      String emailPrefix = email.split('@').first;
      if (password.toLowerCase().contains(emailPrefix.toLowerCase())) {
        strength -= 3;
      }
    }

    // repeated words or sequences (ex: "abcabc", "123123", "passwordpassword")
    if (RegExp(r'(.{2,}?)\1+').hasMatch(password)) {
      final matches = RegExp(r'(.{2,}?)\1+').allMatches(password);
      if (matches.length > 1) {
        strength -= 3;
      } else {
        strength -= matches.first.group(0)!.length * 0.1;
      }
    } else {
      strength += RegExp(r'[A-Z0-9!@#$%^&*]').allMatches(password).length * 0.1;
    }

    // penalize ordered numbers in sequence with higher penalty for longer sequences 123, 1234, 4321
    if ((RegExp(r'(012|123|234|345|456|567|678|789)').hasMatch(password) ||
        RegExp(r'(987|765|654|543|432|321|210)').hasMatch(password))) {
      final matches = RegExp(
        r'(012|123|234|345|456|567|678|789|987|876|765|654|543|432|321|210)',
      ).allMatches(password);
      for (final match in matches) {
        strength -= match.group(0)!.length * (password.length < 12 ? 0.5 : 0.3);
      }
    }

    passwordStrength = strength.clamp(0, 10) / 10; // expected range: 0.0 to 1.0
  }
}
