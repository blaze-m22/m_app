import 'package:flutter/material.dart';
import 'package:m_ap/models/dummy_data.dart';
import 'package:m_ap/screens/categoryMealScreen.dart';
import 'package:m_ap/screens/categoryScreen.dart';
import 'package:m_ap/screens/filters_screen.dart';
import 'package:m_ap/screens/meal_detailScreen.dart';
import 'package:m_ap/screens/tabs_screen.dart';

import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M_App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //    if (settings.name == '/meal-detail'){}
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (setting){
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
