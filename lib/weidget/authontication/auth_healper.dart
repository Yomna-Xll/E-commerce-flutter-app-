import 'package:flutter/material.dart';

class AuthHealper extends StatefulWidget {
  AuthHealper({super.key});

  @override
  State<AuthHealper> createState() => _AuthHealperState();
}

class _AuthHealperState extends State<AuthHealper> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: check,
          onChanged: (value) {
            setState(() {
              check = value;
            });
          },
        ),
        InkWell(
          onTap: () {
            setState(() {
              check = !check!;
            });
          },
          child: Text(
            'Remmember me',
            style: TextStyle(
              color: Color(0xff000C14),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'forget pasword',
            style: TextStyle(
              color: Color(0xffFB344F),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
