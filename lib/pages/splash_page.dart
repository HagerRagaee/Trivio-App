import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      FirebaseAuth.instance.currentUser == null
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox.shrink(),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(170),
          ),
          child: CircleAvatar(
            radius: 80,
            backgroundColor: const Color(0xFFFFFFFF),
            child: const CircleAvatar(
              radius: 70,
              child: Image(
                image: AssetImage("images/test.gif"),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Online Test",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
      ]),
    ));
  }
}
