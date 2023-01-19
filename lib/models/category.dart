import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.purple,
  });
}

// dummy data
const DummyData = const [
  Category(
    id: 'c1',
    title: 't1',
    color: Colors.red,
  ),
  Category(
    id: 'c2',
    title: 't2',
    color: Colors.pink,
  ),
  Category(
    id: 'c3',
    title: 't3',
    color: Colors.green,
  ),
  Category(
    id: 'c4',
    title: 't4',
    color: Colors.yellow,
  ),
];

class Meal {
  final String id;
  final List<String> categoryIds;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.id,
    @required this.categoryIds,
  });
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
