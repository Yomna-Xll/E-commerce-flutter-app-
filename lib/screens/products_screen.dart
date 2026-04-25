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
    myproducts1 = getdata();
    getcategory();
  }

  late Future<List<ProductsModel>> myproducts1;
  List<ModelCategory> mycategory = [];
  List<ProductsModel> productsList = [];
  Future<void> deletedata(int id) async {
    try {
      final res2 = await dio.delete(
        "https://api.escuelajs.co/api/v1/products/$id",
      );
      print("Success: ${res2.data}");
    } catch (e) {
      print("$e");
    }
  }

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
                  return BuildHorizontalChips(category1: mycategory[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: FutureBuilder<List<ProductsModel>>(
                future: myproducts1,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error'));
                  } else if (snapshot.hasData) {
                    if (productsList.isEmpty) {
                      productsList = snapshot.data!;
                    }

                    return GridView.builder(
                      itemCount: productsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 35,
                            crossAxisSpacing: 25,
                            childAspectRatio: 2.7 / 3,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return BuildCard(
                          products: productsList[index],
                          onPressed: () async {
                            setState(() {
                              productsList.removeAt(index); 
                            });
                            await deletedata(productsList[index].id);
                          },
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Dio dio = Dio();

  Future<List<ProductsModel>> getdata() async {
    try {
      final res = await dio.get('https://api.escuelajs.co/api/v1/products');
      return (res.data as List).map((e) => ProductsModel.fromjson(e)).toList();
    } catch (e) {
      return [];
    }
    // print("lenght: ${myproducts1.length}");
  }

  Future<List<ModelCategory>> getcategory() async {
    final res2 = await dio.get('https://api.escuelajs.co/api/v1/categories');
    // print(res2);
    setState(() {
      mycategory = (res2.data as List)
          .map((e) => ModelCategory.fromjson(e))
          .toList();
    });

    return mycategory;
    // print("lenght: ${mycategory.length}");
  }
}
