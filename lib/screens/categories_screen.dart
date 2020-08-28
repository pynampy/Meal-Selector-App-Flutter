import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
          body: GridView(

            padding: EdgeInsets.all(25),
            
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  title: catData.title,
                  color: catData.color,
                  id: catData.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 35,
          mainAxisSpacing: 35,
        ),
      ),
    );
  }
}
