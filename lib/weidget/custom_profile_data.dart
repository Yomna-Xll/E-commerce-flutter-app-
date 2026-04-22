import 'package:flutter/material.dart';

class CustomProfileData extends StatelessWidget {
  CustomProfileData({super.key, required this.favorite ,required this.myicon});
  String favorite;
  IconData myicon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
      },
      child: Row(
        children: [
          Icon(myicon, color: Colors.black),
          const SizedBox(width: 30),
          Text(
            favorite,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
    
  }
}
