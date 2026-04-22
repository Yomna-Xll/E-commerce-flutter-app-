import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'package:flutter_application_day7/screens/profile_screen.dart';
import 'package:flutter_application_day7/weidget/build_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductsModel> product_list = [];
  void initState() {
    super.initState();
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'assets/images/profile.jpg',
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                'Hello!',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'YAN',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF8F7F7),
                      ),
                      child: SvgPicture.asset('assets/icons/Frame.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff6055D8),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 135,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Get Winter Discount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '   20% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            ' For Childern',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 38),
              Row(
                children: [
                  Text(
                    'Featured',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xff6055D8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: product_list.isEmpty
                    ? Center(
                        child: Text("-------------------"),
                      ) 
                    : ListView.builder(
                        //shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: product_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BuildCard(products: product_list[index]);
                        },
                      ),
              ),
              Row(
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xff6055D8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: product_list.isEmpty
                    ? Center(
                        child: Text("============================="),
                      ) 
                    : ListView.builder(
                        //shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: product_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BuildCard(products: product_list[index]);
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

  Future<void> getproduct() async {
    final res3 = await dio.get('https://api.escuelajs.co/api/v1/products');
    for (var element in res3.data) {
      final ProductsModel product_ = ProductsModel.fromjson(element);
      product_list.add(product_);
    }

    setState(() {});
    print("lenght: ${product_list.length}");
  }
}
