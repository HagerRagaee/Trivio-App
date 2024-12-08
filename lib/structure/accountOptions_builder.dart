import 'package:flutter/material.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'package:quiz_app/pages/sign_up_page.dart';

class AccountOptionsBuilder extends StatelessWidget {
  const AccountOptionsBuilder(
      {super.key, required this.action, required this.option});
  final String option;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              option,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(172, 245, 245, 245),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  action == "Create account"
                      ? Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        )
                      : Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                },
                child: Text(action),
              ),
            ),
          ],
        ));
  }
}
