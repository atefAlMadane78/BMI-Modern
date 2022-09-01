import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../content/models/category.dart';
import '../content/models/meal.dart';
import '../content/DD.dart';

class mealProvider with ChangeNotifier {
  List<Meal> favoriteMeals = [];

  List<String> prefsMealId = [];

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefsMealId = prefs.getStringList("prefsMealId") ?? [];
    for (var mealId in prefsMealId) {
      final existingIndex =
          favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex < 0) {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }
  }

    void toggleFavorite(String mealId) async {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefsMealId.remove(mealId);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("prefsMealId", prefsMealId);
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }
}
