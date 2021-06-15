import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem({this.color, this.title, this.id});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoriesMealsScreen.routeName, arguments: {'id':id,'title':title},
      // MaterialPageRoute(
      //   builder: (_) {
      //     return CategoriesMealsScreen(
      //       categoryId: id,
      //       categoryTitle: title,
      //     );
      //   },
      // ),  this is used with Navigator.of(context).push() 
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Container(
          alignment: Alignment.centerLeft,
          height: 35,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '$title',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(5, 5, 5, 0.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
