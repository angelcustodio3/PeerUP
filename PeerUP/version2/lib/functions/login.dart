import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/homepage.dart';

Future<UserCredential?> signInWithEmailPassword(
    String email, String password, context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => const Homepage(
                title: '',
              )),
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    // Handle error, show error message, etc.
    print(e);
    return null;
  }
}
