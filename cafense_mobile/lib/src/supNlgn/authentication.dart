import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

  Stream<User?> get authStatChanges => _firebaseAuth.authStateChanges();

  Future<String?> logIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String uname,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Registered";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
