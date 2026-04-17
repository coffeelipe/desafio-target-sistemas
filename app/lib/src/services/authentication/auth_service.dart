import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> registerUser(
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
      throw Exception('Caught exception during registration: $e');
    }
  }
}
