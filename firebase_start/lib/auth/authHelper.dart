import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthHelper {
  AuthHelper._();
  FirebaseAuth firebase = FirebaseAuth.instance;
  static AuthHelper HelperAuth = AuthHelper._();
  Future<bool?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Sucess');
    } catch (e) {
      AppRouter.appRouter
          .showCustomDialoug('Error in registration', e.toString());
    }
  }

  Future<bool?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      AppRouter.appRouter
          .showCustomDialoug('Error in Authentication', e.toString());
    }
    //userCredential.user.email;
  }

  signOut() async {}
  resetPassword(String email) async {}
  verifyEmail(String email) async {}
}
