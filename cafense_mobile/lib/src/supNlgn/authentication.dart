import 'package:cafense_mobile/src/supNlgn/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({ Key? key }) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
bool isToggle = false;

void toggleScreen() {
  setState(() {
    isToggle = !isToggle;
  });
}

  @override
  Widget build(BuildContext context) {
    if(isToggle){
      return
    }else{
    return Login(toggleScreen:toggleScreen);}
  }
}




class Authenticationx {
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

  Future<String?> resetPwrd({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Verification Send";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
