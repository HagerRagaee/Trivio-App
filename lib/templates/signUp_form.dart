// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/Data/authentication_data.dart';
import 'package:quiz_app/structure/button_builder.dart';
import 'package:quiz_app/structure/textField_builder.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController nameController = TextEditingController();

  late AuthenticationActions authenticationActions;
  @override
  void initState() {
    authenticationActions =
        AuthenticationActions(emailController, passwordController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get Started ",
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
        padding: const EdgeInsets.all(14.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldBuilder(
                controller: nameController,
                fieldName: "UserName",
              ),
              SizedBox(height: 20),
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
              TextFieldBuilder(
                controller: confirmPassword,
                fieldName: "Confirm Password",
              ),
              SizedBox(height: 40),
              ButtonBuilder(
                buttonName: "Sign Up",
                click: () => authenticationActions.signIn(context),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
