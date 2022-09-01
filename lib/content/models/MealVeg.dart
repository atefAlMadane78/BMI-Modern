import 'package:flutter/material.dart';

class MealVeg {
  final String id;
  final String title;
  final Color color;
  final List<String> categories;
  final String imageUrl;
  final String calories;

  const MealVeg({
    required this.id,
    required this.title,
    this.color = Colors.yellow,
    required this.categories,
    required this.imageUrl,
    required this.calories,
  });
}
