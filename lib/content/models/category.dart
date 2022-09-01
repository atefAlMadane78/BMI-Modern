import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String image;
  final bool ya;
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.white,
    required this.image,
    required this.ya,
  });
}
