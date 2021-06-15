import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  

  MealItem({
    @required this.id,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,);
    // ).then((result) {
    //   if(result != null){
    //     removeItem(result);
    //   }
    // });
  }

  String get complexityText {
    // if(complexity == Complexity.Challenging){
    //   return 'Challenging';
    // }
    // if(complexity == Complexity.Hard){
    //   return 'Hard';
    // }
    // if(complexity == Complexity.Simple){
    //   return 'Simple';
    // }     when using multiple if statements in a method, using a switch statement is better
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                // child:
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(5, 5, 5, 0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(7.5),
                  margin: EdgeInsets.only(
                    bottom: 7.5,
                    right: 7.5,
                  ),
                  child: Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(': $duration min'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
