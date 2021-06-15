import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function toggleFavourites;
  final Function isFavourite;

  MealDetailsScreen({this.toggleFavourites,this.isFavourite});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(BuildContext context, Widget content) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: content);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
            //  softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'INGREDIENTS:'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              buildSectionTitle(context, 'STEPS:'),
              buildContainer(
                context,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height:20,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
          onPressed: (){toggleFavourites(mealId);},
          ),
        );
  }
}
