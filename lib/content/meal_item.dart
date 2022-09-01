import 'package:flutter/material.dart';
import './models/meal.dart';
import './DD.dart';
import './meal_details.dart';

class Meal_item extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;
  final String calories;
  final List ingredients;
  final int where;
  const Meal_item({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.calories,
    required this.ingredients,
    required this.where,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
       // color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin:const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child:where == 1 ? Image.asset(imageUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover)
                      : Image.asset(imageUrl, height: 137,
                      fit: BoxFit.fill),
                ),
                if(where ==1)
                Positioned(
                  // padding: EdgeInsets.all(8.0),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 400,
                    color: Colors.white30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style:const TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontFamily: 'RobotoCondensed',
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.food_bank),
                            Text(
                              "$calories",
                              style:const TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoCondensed',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],

                      // width: 300,
                      //color: Colors.black54,
                      //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      /* child: Text(
                      title,
                      style: TextStyle(
                       // fontSize: 27,
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),*/
                    ),
                  ),
                ),
                if(where ==2)
                Positioned(
                  // padding: EdgeInsets.all(8.0),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white30,
                    child: Text(
                                title,
                                style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                  ),)
              ],
            ),
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.food_bank),
                  SizedBox(width: 6),
                  Text(
                    "$calories",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoCondensed',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
