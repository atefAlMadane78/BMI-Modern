import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduals/mealProvider.dart';
import './DD.dart';

class cat2 extends StatefulWidget {
  //final Function toggleFavorites;
  //final Function isMealFavorite;
  final String imageUrl;
  final String title;
  final String id;
  final String calories;
  //final Function toggleFavorites;
  //final Function isMealFavorite;
  //final List ingredients;
  const cat2({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.calories,
    //required this.toggleFavorites,  
    //required this.isMealFavorite,  
    //required this.ingredients,
  });

  @override
  State<cat2> createState() => _cat2State();
}

class _cat2State extends State<cat2> {
  @override
  Widget build(BuildContext context) {
    //final mealId = ModalRoute.of(context)!.settings.arguments as String;
    //final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    //return Scaffold(
    //body: Container(
    return Container(
      child: Card(
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
                  borderRadius:const  BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(widget.imageUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  // padding: EdgeInsets.all(20),
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 400,
                    color: Colors.white30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.title,
                              style:const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'RobotoCondensed',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                           const Icon(Icons.food_bank),
                            Text(
                              "${widget.calories}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoCondensed',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                           // Icon(Icons.star),
                           IconButton(
                            onPressed: (){
                             // toggleFavorites(id);
                             setState(() {
                                Provider.of<mealProvider>(context, listen: false).toggleFavorite(widget.id);
                             });
                            
                           //  print( Provider.of<mealProvider>(context, listen: false).prefsMealId);
                            },
                             icon: /*isMealFavorite(id)*/
                             Provider.of<mealProvider>(context, listen: false).isFavorite(widget.id)
                              ? const Icon(Icons.star) :const Icon(Icons.star_border),)
                          ],
                          /*  FloatingActionButton(
                                onPressed: () => toggleFavorites(mealId),
                                child: Icon(
                                  isMealFavorite(mealId)
                                      ? Icons.star
                                      : Icons.star_border,
                                ),
                              ),*/
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
              /*children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(imageUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}*/
