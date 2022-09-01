import 'package:flutter/material.dart';
import 'package:x2/Screen/move_detail.dart';
import 'package:x2/Screen/program_details.dart';
import '../moduals/item.dart';

class move_sport extends StatelessWidget {
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String title;
  final String id;
  final int n;
  

  const move_sport(
      {Key? key,
      required this.imgUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.title, required this.id,imageUrl, required this.n, });
      //: super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  void select_move(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(move_detail.routeName,
    arguments: id,);
  }
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select_move(context),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin:const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  ),
                  child:n == 1 ?Image.asset(imgUrl,height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,) :
                     Image.asset(imgUrl,height: 137 ,
                    fit: BoxFit.fill,)
                /*   Image.network(
                    imgUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),*/
                ),
                if(n==1)
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                    padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style:const TextStyle(color: Colors.white, fontSize: 26),
                    ) 
                  ),
                ),
                if(n ==2 )
                Positioned(
                  // padding: EdgeInsets.all(8.0),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white70,
                    child: Text(
                                title,
                                style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                ),
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                  ),)
              ],
            ),
          /*  Padding(
              padding:const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$complexityText")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$affordabilityText")
                    ],
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
