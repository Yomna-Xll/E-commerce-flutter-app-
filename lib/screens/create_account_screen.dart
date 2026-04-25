import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/screens/main_pages.dart';
import 'package:flutter_application_day7/validators.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_buttom.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_divider.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_header.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_healper.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_lable.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_other_way_login.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_password_feild.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_text_feild.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    GlobalKey<FormState> mykey = GlobalKey<FormState>();
    bool isLoading = false;
    Dio dio = Dio();
    Future<void> postData() async {
      setState(() {
        isLoading = true;
      });
      try {
        final response = await dio.post(
          "https://api.escuelajs.co/api/v1/users/",
          data: {
            "name": "Nicolas",
            "email": "nico@gmail.com",
            "password": "1234",
            "avatar": "https://picsum.photos/800",
          },
        );
        setState(() {
          isLoading = false;
        });
      } on DioException catch (e) {
        if (e.response != null) {
          print("${e.response?.data['message']}");
          setState(() {
            isLoading = false;
          });
        } else {
          print("${e.message}");
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        print("$e");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: mykey,
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
                  AuthTextFeild(
                    Hinttext: 'Enter your email',
                    controller: emailcontroller,
                    validator: (value) => Validator.validateEmail(value!),
                  ),
                  SizedBox(height: 30),
                  AuthLable(LableNmae: 'Phone Namber'),
                  SizedBox(height: 10),
                  AuthTextFeild(
                    Hinttext: 'Enter your Phone Number',
                    controller: phonecontroller,
                    validator: (value) => Validator.validatePhoneNumber(value!),
                  ),
                  SizedBox(height: 30),
                  AuthLable(LableNmae: 'Password'),
                  SizedBox(height: 10),
                  AuthPasswordFeild(
                    PasswordText: 'Enter your password',
                    passwordcontroller: passwordcontroller,
                    validator2: (value) => Validator.validatePassword(value!),
                  ),
                  SizedBox(height: 30),
                  AuthHealper(),
                  AuthButtom(
                    ButtomText: isLoading  ? "loading " : "Login",
                    onPressed: () {
                      if (mykey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPages()),
                        );
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
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
      ),
    );
  }
}
