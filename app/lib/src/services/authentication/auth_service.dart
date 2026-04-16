import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> createNewUser(String email, String password) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {}
  }
}
