import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/model_category.dart';
import 'package:flutter_application_day7/models/products_model.dart';
import 'package:flutter_application_day7/screens/specific_product_screen.dart';

class BuildHorizontalChips extends StatelessWidget {
  BuildHorizontalChips({super.key, required this.category1});
  ModelCategory category1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SpecificProduct(cataid: category1.id!, catName: category1.name);
              },
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Expanded(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(category1.image),
                  radius: 50,
                ),
              ),
            ),

            Text(
              category1.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
