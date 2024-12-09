import 'package:flutter/material.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: const Color.fromARGB(214, 238, 238, 238),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/google.png",
                  height: 35,
                ),
                SizedBox(width: 12),
                Text(
                  "Google",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 40),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: const Color.fromARGB(214, 238, 238, 238),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  size: 35,
                  color: Colors.blue,
                ),
                SizedBox(width: 12),
                Text(
                  "Facebook",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
