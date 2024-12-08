// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/login_page.dart';

class AuthenticationActions {
  TextEditingController emailsController;
  TextEditingController passwordController;

  AuthenticationActions(this.emailsController, this.passwordController) {
    emailsController = TextEditingController();
    passwordController = TextEditingController();
  }

  createAccont(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailsController.text, password: passwordController.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailsController.text,
        password: passwordController.text,
      );
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
