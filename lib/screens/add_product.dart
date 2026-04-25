import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'package:flutter_application_day7/screens/products_screen.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_buttom.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_lable.dart';
import 'package:flutter_application_day7/weidget/authontication/auth_text_feild.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController addcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  final dio = Dio();
  Future<void> addProduct() async {
    try {
      final response = await dio.post(
        "https://api.escuelajs.co/api/v1/products/",
        data: {
          "title": titlecontroller.text,
          "price": int.parse(pricecontroller.text),
          "description": descontroller.text,
          "categoryId": idcontroller.text,
          "images": ["https://i.imgur.com/QkIa5tT.jpeg"],
        },
      );
      log("Success: ${response.data}");
    } on DioException catch (e) {
      print("Status Code: ${e.response?.statusCode}");
      print("Error Details: ${e.response?.data}");
    }
  }

  

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
        child: SingleChildScrollView(
          child: Form(
            key: mykey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthLable(LableNmae: 'Titl'),
                SizedBox(height: 5),
                AuthTextFeild(
                  Hinttext: 'add title',
                  controller: titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("this feild is require");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                AuthLable(LableNmae: 'Description'),
                SizedBox(height: 5),
                AuthTextFeild(
                  Hinttext: 'add description',
                  controller: descontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("this feild is require");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                // AuthLable(LableNmae: 'Image'),
                // SizedBox(height: 5),
                // AuthTextFeild(
                //   Hinttext: 'add image',
                //   controller: imagecontroller,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return ("this feild is require");
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 15),
                AuthLable(LableNmae: 'Price'),
                SizedBox(height: 5),
                AuthTextFeild(
                  Hinttext: 'add price',
                  controller: pricecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("this feild is require");
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                AuthLable(LableNmae: 'Catigory Id'),
                SizedBox(height: 5),
                AuthTextFeild(
                  Hinttext: 'add catigoey id',
                  controller: idcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("this feild is require");
                    }
                    return null;
                  },
                ),
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
                    onPressed: () {
                      if (mykey.currentState!.validate()) {
                        log(titlecontroller.text);
                        print(descontroller.text);
                        print(pricecontroller.text);
                        addProduct();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Products()),
                        );
                      } else {
                        print("validation failed");
                      }
                    },
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
