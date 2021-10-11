import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authservices with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future logIn(String email, String password) async {
    setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setMessage("No Internet Connection");
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      setMessage(e.message);
      setLoading(false);
    }
    notifyListeners();
  }

  Future register(String uname, String email, String password) async {
    setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setMessage("No Internet Connection");
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      setMessage(e.message);
      setLoading(false);
    }
    notifyListeners();
  }

  Future<String?> resetPwrd({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Verification Send";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User> get user =>
      firebaseAuth.authStateChanges().map((event) => event!);
}
