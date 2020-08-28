import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.title, this.color, this.id});

  
  
  
  void selectCategory(BuildContext ctx){

        Navigator.of(ctx).pushNamed(CategoryMealScreen.route,
        arguments: {'id': id, 'title' : title});
              }
    

  
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
          child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
        style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ), 
            ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
