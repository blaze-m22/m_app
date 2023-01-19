import 'package:flutter/material.dart';
import 'package:m_ap/models/category.dart';
import 'package:m_ap/widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        children: DummyData.map((catData) => CategoryItem(
            catData.id,
            catData.title,
            catData.color
        )).toList()
    );
  }
}
