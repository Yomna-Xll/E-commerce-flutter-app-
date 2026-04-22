import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthHeader extends StatelessWidget {
  AuthHeader({super.key, required this.title, required this.subTitle});
  String title = '' , subTitle = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: Color(0xff999EA1),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
