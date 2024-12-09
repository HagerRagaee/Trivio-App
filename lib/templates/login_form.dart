// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/Data/authentication_data.dart';
import 'package:quiz_app/pages/sign_up_page.dart';
import 'package:quiz_app/structure/button_builder.dart';
import 'package:quiz_app/structure/signIn_options.dart';
import 'package:quiz_app/structure/textField_builder.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthenticationActions authenticationActions;
  @override
  void initState() {
    authenticationActions =
        AuthenticationActions(emailController, passwordController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Image.asset(
              "images/quiz2.png",
              height: 35,
            )
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Enter your details below",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[500],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldBuilder(
                  controller: emailController,
                  fieldName: "Email",
                ),
                SizedBox(height: 20),
                TextFieldBuilder(
                  controller: passwordController,
                  fieldName: "Password",
                ),
                SizedBox(height: 20),
                ButtonBuilder(
                  buttonName: "Sign in",
                  click: () => authenticationActions.signIn(context),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Forget your password? ",
          style: TextStyle(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don`t have an account?",
              style: TextStyle(color: Colors.grey[600]),
            ),
            TextButton(
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            )
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Text(
                  "Or Sign in with",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SigninOptions()
      ],
    );
  }
}
