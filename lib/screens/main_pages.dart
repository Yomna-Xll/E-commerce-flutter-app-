import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'add_product.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'products_screen.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int currentpage = 0;
  @override
  List<Widget> pages = [
    HomeScreen(),
    Products(),
    AddProduct(),
    ProfileScreen(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xff6055D8),
        activeColor: Colors.white,
        color: Colors.grey,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.home, title: 'Products'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.home, title: 'Profile'),
        ],
        initialActiveIndex: currentpage,
        onTap: (int i) {
          setState(() {
            currentpage = i;
          });
        },
      ),
    );
  }
}
