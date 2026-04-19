import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: avoid_print

class AuthService {
  static const String _serviceTag = '[AUTH_SERVICE]';

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print('$_serviceTag Caught exception during sign out: $e');
    }
  }

  Future<bool> updateUserDisplayName(String newName) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return false;
      }

      await user.updateDisplayName(newName);
      await user.reload();
      return true;
    } on FirebaseAuthException catch (e) {
      print('$_serviceTag Caught exception during displayName update: $e');
      return false;
    }
  }

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
