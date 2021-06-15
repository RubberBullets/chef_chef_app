import 'package:flutter/material.dart';


import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoriesMealsScreen({this.availableMeals});

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  
  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // displayedMeals = DUMMY_MEALS.where((meal){
    //   return meal.categories.contains(categoryId);
    // }).toList();    //due to use of 'ModalRoute.of(context)' in intState() 
    // we see error get thrown. this is because initState() runs before anything else is drawn yet.
    // so for dynamic changes, it's better to put code in didChangeDependencies function
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData){
      final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            );
        },itemCount: displayedMeals.length,
      ),
    );
  }
}
