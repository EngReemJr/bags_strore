import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthHelper {
  AuthHelper._();
  FirebaseAuth firebase = FirebaseAuth.instance;
  static AuthHelper HelperAuth = AuthHelper._();
  signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Sucess');
    } catch (e) {
       log('Faild');
    }
    
    }
  }

