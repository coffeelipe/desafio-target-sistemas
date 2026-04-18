import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const String _serviceTag = '[AUTH_SERVICE]';

  Future<UserCredential?> registerUser(
    String email,
    String password,
    String username,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user!.updateDisplayName(username);

      return credential;
    } on FirebaseAuthException catch (e) {
      print('$_serviceTag Caught exception during registration: $e');
      return null;
    }
  }

  Future<UserCredential?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print('$_serviceTag Caught exception during login: $e');
      return null;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (e) {
      print('$_serviceTag Caught exception while fetching current user $e');
      return null;
    }
  }
}
