import 'package:flutter/material.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_buttom.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_divider.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_header.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_healper.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_lable.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_other_way_login.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_password_feild.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_text_feild.dart';
import 'package:flutter_application_day7/screens/create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: 'Hi, Wecome Back! 👋',
                  subTitle: 'Hello again, you’ve been missed!',
                ),
                SizedBox(height: 51),
                AuthLable(LableNmae: 'Email'),
                SizedBox(height: 10),
                AuthTextFeild(Hinttext: 'Enter your email'),
                SizedBox(height: 30),
                AuthLable(LableNmae: 'Password'),
                SizedBox(height: 10),
                AuthPasswordFeild(PasswordText: 'Enter your password'),
                SizedBox(height: 30),
                AuthHealper(),
                AuthButtom(ButtomText: 'Login'),
                AuthDivider(),
                AuthOtherWayLogin(),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account ? '),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccount(),
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
