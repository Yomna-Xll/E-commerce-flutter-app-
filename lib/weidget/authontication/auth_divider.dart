import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xff000000), thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Or With',
                      style: TextStyle(
                        color: Color(0xff999EA1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xff000000), thickness: 1),
                  ),
                ],
              );
  }
}