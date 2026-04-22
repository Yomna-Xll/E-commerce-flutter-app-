import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthOtherWayLogin extends StatefulWidget {
  const AuthOtherWayLogin({super.key});

  @override
  State<AuthOtherWayLogin> createState() => _AuthOtherWayLoginState();
}

class _AuthOtherWayLoginState extends State<AuthOtherWayLogin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Color(0xffCDD1E0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/Vector.svg'),
                    SizedBox(width: 10),
                    Text('GitHub', style: TextStyle()),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Color(0xffCDD1E0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/Group.svg'),
                    SizedBox(width: 10),
                    Text('GitLab', style: TextStyle()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
