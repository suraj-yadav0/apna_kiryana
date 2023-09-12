
import 'package:apna_kiryana/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch(error) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> signup(String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch(error) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      showMessage(error.code.toString());
      return false;
    }
  }
}
