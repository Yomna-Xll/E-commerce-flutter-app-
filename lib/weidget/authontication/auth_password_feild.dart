import 'package:flutter/material.dart';

class AuthPasswordFeild extends StatefulWidget {
  AuthPasswordFeild({super.key, required this.PasswordText});
  String PasswordText;

  @override
  State<AuthPasswordFeild> createState() => _AuthPasswordFeildState();
}

class _AuthPasswordFeildState extends State<AuthPasswordFeild> {
  bool ishidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: ishidden,
      decoration: InputDecoration(
        hintText: widget.PasswordText,
        suffixIcon: IconButton(
          icon: Icon(ishidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              ishidden = !ishidden;
            });
          },
        ),
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
