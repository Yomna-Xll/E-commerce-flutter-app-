import 'package:flutter/material.dart';

class AuthTextFeild extends StatelessWidget {
  AuthTextFeild({super.key, required this.Hinttext, this.suffixicon});
  String Hinttext = '';
  Widget? suffixicon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: Hinttext,
        suffixIcon: suffixicon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
