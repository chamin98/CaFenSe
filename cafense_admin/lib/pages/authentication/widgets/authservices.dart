import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authservices extends GetxController {
  String? _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  String? get errorMessage => _errorMessage;
  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(firebaseAuth.authStateChanges());
    super.onInit();
  }

  void logIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      setMessage(e.message);
    }
  }

  void signout() async {
    await firebaseAuth.signOut();
  }

  void setMessage(message) {
    _errorMessage = message;
  }
}
