import 'package:flutter/material.dart';

class AuthPasswordFeild extends StatefulWidget {
  AuthPasswordFeild({
    super.key,
    required this.PasswordText,
    required this.passwordcontroller,
    required this.validator2,
  });
  String PasswordText;
  TextEditingController? passwordcontroller;
  String? Function(String?)? validator2;
  @override
  State<AuthPasswordFeild> createState() => _AuthPasswordFeildState();
}

class _AuthPasswordFeildState extends State<AuthPasswordFeild> {
  bool ishidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator2,
      controller: widget.passwordcontroller,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
