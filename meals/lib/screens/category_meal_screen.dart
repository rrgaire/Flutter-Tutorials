import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CatergoryMealScreen extends StatelessWidget {
  // final String id;
  // final String categoryItem;

  // CatergoryMealScreen(this.id, this.categoryItem);

  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryItem = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            affordability: categoryMeal[index].affordability,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
