

import './dummy_data.dart';
import './models/meal.dart';

import './screens/Filters_screen.dart';
import 'package:flutter/material.dart';

import './screens/categories_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String,bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId){
    final existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)
        );
      });
    }
  }
  bool _isMealsFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chef Chef App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Color.fromRGBO(63, 81, 181, 1),
        primaryColorDark: Color.fromRGBO(48, 63, 159, 1),
        primaryColorLight: Color.fromRGBO(197, 202, 233, 1),
        accentColor: Color.fromRGBO(3, 169, 244, 1),
        iconTheme: IconThemeData(color: Colors.white, opacity: 1,),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(33, 33, 33, 1),),
          bodyText2: TextStyle(color: Color.fromRGBO(33, 33, 33, 1),),
          headline6: TextStyle(color: Color.fromRGBO(55 , 55, 55, 1),
          fontFamily: 'RobotoCondensed',),
        ),


      ),
      initialRoute: '/',//   '/' is default
      routes: {
        '/':(ctx)=> TabsScreen(favouriteMeals: _favouriteMeals),
        //     '/category-meals':(ctx) => CategoriesMealsScreen(),
        FiltersScreen.routeName:(ctx) => FiltersScreen(saveFilters:_setFilters,currentFilters: _filters,),
        CategoriesMealsScreen.routeName:(ctx) => CategoriesMealsScreen(availableMeals:_availableMeals,),
        MealDetailsScreen.routeName:(ctx) => MealDetailsScreen(toggleFavourites:_toggleFavourites, isFavourite: _isMealsFavourite),
      },
     // home: CategoriesScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: 
//             CategoriesScreen(),
          
        
      
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
