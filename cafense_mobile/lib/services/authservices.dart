import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authservices with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user =>
      firebaseAuth.authStateChanges().map((event) => event);

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
      await authResult.user!.updateDisplayName(uname);
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
  
  Future resetPwrd({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on SocketException {
      setMessage("No Internet Connection");
    } on FirebaseAuthException catch (e) {
      setMessage(e.message);
    }
  }

  Future signout() async {
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
}
