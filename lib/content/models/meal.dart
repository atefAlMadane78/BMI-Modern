import 'package:flutter/material.dart';


class Meal {
  final String id;
  final String title;
  final Color color;
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredients;
  final String calories;
  final bool a;

  const Meal({
    
    required this.id,
    required this.title,
    this.color = Colors.yellow,
    required this.categories,
    required this.imageUrl,
    required this.ingredients,
    required this.calories,
    required this.a,
  });
}
