import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduals/mealProvider.dart';
import './DD.dart';

class MealDetails extends StatefulWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorites;
  final Function isMealFavorite;
  const MealDetails(this.toggleFavorites, this.isMealFavorite);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
    //  backgroundColor: Colors.white,
      appBar: AppBar(title: Text(selectedMeal.title), backgroundColor: const Color.fromARGB(255, 194, 86, 204),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Ingredients",
                style: TextStyle(
                 // color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              // margin: EdgeInsets.all(10),
              // padding: EdgeInsets.all(10),
              height: 200,
              width: 400,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.white10,
                  //color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: const TextStyle(
                        //color: Colors.white,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Provider.of<mealProvider>(context, listen: false)
                .toggleFavorite(mealId);
          });
        } /*=> toggleFavorites(mealId)*/,

        //Navigator.of(context).pop();

        child: Icon(
          /*isMealFavorite(mealId)*/
          Provider.of<mealProvider>(context, listen: false).isFavorite(mealId)
              ? Icons.star
              : Icons.star_border,
          //color: Colors.white10,
        ),
      ),
    );
  }
}
