import 'package:flutter/material.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_buttom.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_lable.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_text_feild.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD PRODUCT',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthLable(LableNmae: 'Title'),
            SizedBox(height: 5),
            AuthTextFeild(Hinttext: 'add title'),
            SizedBox(height: 15),
            AuthLable(LableNmae: 'Description'),
            SizedBox(height: 5),
            AuthTextFeild(Hinttext: 'add description'),
            SizedBox(height: 15),
            AuthLable(LableNmae: 'Image'),
            SizedBox(height: 5),
            AuthTextFeild(Hinttext: 'add image'),
            SizedBox(height: 15),
            AuthLable(LableNmae: 'Price'),
            SizedBox(height: 5),
            AuthTextFeild(Hinttext: 'add price'),
            SizedBox(height: 15),
            AuthLable(LableNmae: 'Catigory Id'),
            SizedBox(height: 5),
            AuthTextFeild(Hinttext: 'add catigoey id'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6055D8),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6055D8),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'DELETE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
