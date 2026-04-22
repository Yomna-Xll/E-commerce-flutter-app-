import 'package:flutter/material.dart';
import 'package:flutter_application_day7/screens/add_product.dart';
import 'package:flutter_application_day7/screens/create_account_screen.dart';
import 'package:flutter_application_day7/screens/details_screen.dart';
import 'package:flutter_application_day7/screens/home_screen.dart';
import 'package:flutter_application_day7/screens/login_screen.dart';
import 'package:flutter_application_day7/screens/main_pages.dart';
import 'package:flutter_application_day7/screens/products_screen.dart';
import 'package:flutter_application_day7/screens/profile_screen.dart';
import 'package:flutter_application_day7/screens/specific_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
