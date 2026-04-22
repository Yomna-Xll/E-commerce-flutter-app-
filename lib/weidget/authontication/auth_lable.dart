import 'package:flutter/material.dart';

class AuthLable extends StatelessWidget {
  AuthLable({super.key, required this.LableNmae});
  String LableNmae = '';
  @override
  Widget build(BuildContext context) {
    return Text(
      LableNmae,
      style: TextStyle(
        color: Color(0xff4E0189),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
