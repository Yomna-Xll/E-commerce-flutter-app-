import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_buttom.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_divider.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_header.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_healper.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_lable.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_other_way_login.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_password_feild.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_text_feild.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: "Create an account",
                  subTitle: 'Connect with your friends today!',
                ),
                SizedBox(height: 51),
                AuthLable(LableNmae: 'Email'),
                SizedBox(height: 10),
                AuthTextFeild(Hinttext: 'Enter your email'),
                SizedBox(height: 30),
                AuthLable(LableNmae: 'Phone Namber'),
                SizedBox(height: 10),
                AuthTextFeild(Hinttext: 'Enter your Phone Number'),
                SizedBox(height: 30),
                AuthLable(LableNmae: 'Password'),
                SizedBox(height: 10),
                AuthPasswordFeild(PasswordText: 'Enter your password'),
                SizedBox(height: 30),
                AuthHealper(),
                AuthButtom(ButtomText: 'Login'),
                AuthDivider(),
                AuthOtherWayLogin(),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login'),
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
