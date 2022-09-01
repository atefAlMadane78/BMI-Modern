import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduals/mealProvider.dart';
import './models/meal.dart';
import './meal_item.dart';
import './cat2.dart';
import './DD.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  dynamic s;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("you have no favorites yet.star adding some!"),
      );
    } else {
      return  SingleChildScrollView(
        child:  ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            //s= favoriteMeals[index].id;
          /*  s = DUMMY_MEALS
                .where((element) => element.id == favoriteMeals[index].id)
                .toList();*/

            // print(favoriteMeals[index].id);
            if(favoriteMeals[index].a == true)
            {return cat2(
                imageUrl: favoriteMeals[index].imageUrl,
                title: favoriteMeals[index].title,
                id: favoriteMeals[index].id,
                calories: favoriteMeals[index].calories,);
               }   else
               { return Meal_item(
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              calories: favoriteMeals[index].calories,
              ingredients: favoriteMeals[index].ingredients,
              where: 1,
              
            );}
               // toggleFavorites: ,
               // isMealFavorite: );
            /*Meal_item(
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              calories: favoriteMeals[index].calories,
              ingredients: favoriteMeals[index].ingredients,

              
            );*/
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
