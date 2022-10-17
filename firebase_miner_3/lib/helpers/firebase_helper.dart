import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  FirebaseHelper._();
  static final FirebaseHelper firebaseHelper = FirebaseHelper._();

  ///Making Private Named Constructor...

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //TODO: anonymouslySignIn
  Future<String?> anonymouslySignIn() async {
    UserCredential userCredential = await firebaseAuth.signInAnonymously();

    String uid = userCredential.user!.uid;

    return uid;
  }

  //TODO: SignUp
  Future<User?> SignUp(
      {required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }

  //TODO: SignIn
  Future<User?> SignIn(
      {required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }

  /* //TODO: SignInWithGoogle
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

  //TODO: SignOut
  Future SignOut() async {
    await firebaseAuth.signOut();
  }
}
