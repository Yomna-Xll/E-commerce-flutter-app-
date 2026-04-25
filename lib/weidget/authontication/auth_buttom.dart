import 'package:flutter/material.dart';
import 'package:flutter_application_day7/screens/main_pages.dart';
import 'package:flutter_application_day7/screens/products_screen.dart';

// ignore: must_be_immutable
class AuthButtom extends StatelessWidget {
  AuthButtom({super.key, required this.ButtomText,required this.onPressed});
  // ignore: non_constant_identifier_names
  String ButtomText = '';
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff4E0189),
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          ButtomText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
