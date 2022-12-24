import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log(credential.user!.uid);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('notf');
      } else if (e.code == 'wrong-password') {
        log('wrngps');
      }
    }
  }

  String? checkUser() {
    User? user = firebaseAuth.currentUser;

    return user?.uid;
  }

  signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("message");
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {}
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
