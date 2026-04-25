import 'package:flutter/material.dart';

class AuthTextFeild extends StatelessWidget {
  AuthTextFeild({
    super.key,
    required this.Hinttext,
    this.suffixicon,
    required this.controller,
    required this.validator
  });
  String Hinttext = '';
  Widget? suffixicon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: Hinttext,
        suffixIcon: suffixicon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}
