import 'package:flutter/material.dart';

import '../widgets/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite, isMealFovorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFovorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text) {
    return Container(
        child: Text(
      text,
      style: TextStyle(
        fontSize: 26,
      ),
    ));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              )),
          buildSectionTitle('Ingredients'),
          buildContainer(
            ListView.builder(
                itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                itemCount: selectedMeal.ingredients.length),
          ),
          buildSectionTitle('Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index])),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
            itemCount: selectedMeal.steps.length,
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFovorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
