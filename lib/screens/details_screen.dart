import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'products_screen.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;

  const DetailsScreen({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      productsModel.path,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      height: 49,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd3d0d0),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      height: 49,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd3d0d0),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productsModel.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.37),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color(0xffffc107)),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '( 20 Review)',
                                  style: TextStyle(
                                    color: Color(0xff9B9999),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          productsModel.price,
                          style: TextStyle(
                            color: Color(0xff6055d8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 23),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 9),
                    Text(
                      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff9B9999),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 49,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff6055D8),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: SizedBox(
                            height: 49,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                'assets/icons/Layer 2.svg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
