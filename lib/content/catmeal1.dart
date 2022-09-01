import 'package:flutter/material.dart';
import './cat2.dart';
import './meal_item.dart';
import './catitem.dart';
import './DD.dart';
import './meal_item.dart';

class cat_meal1 extends StatefulWidget {
  static const routeName = 'category_meals';
  final Function toggleFavorites;
  final Function isMealFavorite;
   cat_meal1(this.toggleFavorites, this.isMealFavorite);
  @override
  _cat_meal1State createState() => _cat_meal1State();
}

class _cat_meal1State extends State<cat_meal1> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final catya = routeArg['ya'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(title: Text("$categoryTitle"), backgroundColor:const Color.fromARGB(255, 194, 86, 204),),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          if (catya == false) {
            return Meal_item(
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              calories: categoryMeals[index].calories,
              ingredients: categoryMeals[index].ingredients,
              where: 1,
            );
          } else {
            return cat2(
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              calories: categoryMeals[index].calories,
            //   isMealFavorite: widget.isMealFavorite,
             // toggleFavorites:  widget.toggleFavorites,
              // ingredients: categoryMeals[index].ingredients,
              //isMealFavorite:categoryMeals[index].isMealFavorite,
            );
          }
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
