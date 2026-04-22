import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/model_category.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'package:flutter_application_day7/weidget/build_card.dart';
import 'package:flutter_application_day7/weidget/build_horizontal_chips.dart';

class SpecificProduct extends StatefulWidget {
  SpecificProduct({super.key, required this.cataid, required this.catName});
  int cataid;
  String catName;
  @override
  State<SpecificProduct> createState() => _SpecificProductState();
}

class _SpecificProductState extends State<SpecificProduct> {
  @override
  void initState() {
    super.initState();
    filterdata(id: widget.cataid);
  }

  List<ProductsModel> filterlist = [];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            widget.catName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: filterlist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 35,
                    crossAxisSpacing: 25,
                    childAspectRatio: 2.7 / 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return BuildCard(products: filterlist[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Dio dio = Dio();

  Future<void> filterdata({required id}) async {
    final res3 = await dio.get(
      'https://api.escuelajs.co/api/v1/products/?categoryId=$id',
    );
    print(res3);
    for (var element in res3.data) {
      final ProductsModel cat2 = ProductsModel.fromjson(element);
      filterlist.add(cat2);
    }
    setState(() {
      print('-------------');
    });
  }
}
