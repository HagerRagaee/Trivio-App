import 'package:flutter/material.dart';
import 'package:quiz_app/Data/authentication_data.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'package:quiz_app/structure/button_builder.dart';
import 'package:quiz_app/structure/textField_builder.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  late AuthenticationActions authenticationActions;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

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
            const Text(
              "Get Started ",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Image.asset("images/quiz2.png", height: 35),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Enter your details below",
          style: TextStyle(fontSize: 15, color: Colors.grey[500]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldBuilder(
                  validator: (val) => val == null || val.isEmpty
                      ? "This field is required!"
                      : null,
                  controller: nameController,
                  fieldName: "UserName",
                ),
                const SizedBox(height: 20),
                TextFieldBuilder(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "This field is required!";
                    }
                    // Regular expression to validate email format
                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!emailRegex.hasMatch(val)) {
                      return "Please enter a valid email address!";
                    }
                    return null;
                  },
                  controller: emailController,
                  fieldName: "Email",
                ),
                const SizedBox(height: 20),
                FancyPasswordField(
                  hasStrengthIndicator: true,
                  controller: passwordController,
                  validationRules: {
                    DigitValidationRule(),
                    UppercaseValidationRule(),
                    LowercaseValidationRule(),
                    SpecialCharacterValidationRule(),
                    MinCharactersValidationRule(6),
                    MaxCharactersValidationRule(12),
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required!";
                    }
                    return null; // This will check validation rules
                  },
                ),
                const SizedBox(height: 20),
                TextFieldBuilder(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "This field is required!";
                    }
                    if (val != passwordController.text) {
                      return "Passwords do not match!";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  fieldName: "Confirm Password",
                ),
                const SizedBox(height: 40),
                ButtonBuilder(
                  buttonName: "Sign Up",
                  click: () {
                    if (formState.currentState!.validate()) {
                      print("Validation passed");
                      authenticationActions.createAccount(context);
                    } else {
                      print("Validation failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Have account already?",
              style: TextStyle(color: Colors.grey[600]),
            ),
            TextButton(
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ],
    );
  }
}
