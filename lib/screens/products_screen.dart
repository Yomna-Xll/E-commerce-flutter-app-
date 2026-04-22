import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/model_category.dart';
import 'package:flutter_application_day7/weidget/build_card.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'package:flutter_application_day7/weidget/build_horizontal_chips.dart';

class Products extends StatefulWidget {
  Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    print('-----------');
    getdata();
    getcategory();
  }

  List<ProductsModel> myproducts1 = [];
  List<ModelCategory> mycategory = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mycategory.length,

                itemBuilder: (BuildContext context, int index) {
                  return BuildHorizontalChips(category1: mycategory[index] );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: myproducts1.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 25,
                  childAspectRatio: 2.7 / 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BuildCard(products: myproducts1[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Dio dio = Dio();

  Future<void> getdata() async {
    final res = await dio.get('https://api.escuelajs.co/api/v1/products');
    for (var element in res.data) {
      final ProductsModel product = ProductsModel.fromjson(element);
      myproducts1.add(product);
    }

    setState(() {});
    print("lenght: ${myproducts1.length}");
  }

  Future<void> getcategory() async {
    final res2 = await dio.get('https://api.escuelajs.co/api/v1/categories');
    print(res2);
    for (var element in res2.data) {
      final ModelCategory cat1 = ModelCategory.fromjson(element);
      mycategory.add(cat1);
    }

    setState(() {});
    print("lenght: ${mycategory.length}");
  }
}
