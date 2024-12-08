import 'package:flutter/material.dart';

class TextFieldBuilder extends StatelessWidget {
  TextFieldBuilder(
      {super.key, required this.fieldName, required this.controller});
  final String fieldName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: fieldName == "Password" ? true : false,
      decoration: InputDecoration(
        labelText: fieldName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
