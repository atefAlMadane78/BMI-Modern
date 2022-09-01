import 'package:flutter/material.dart';
import 'package:x2/Widget/sport_item.dart';
import '../1.2%20dummy_data.dart';

class sport_widget extends StatelessWidget {
  const sport_widget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 

       GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children:DUMMY_CATEGORIES
        .map((cat) =>
          sport_item( title: cat.title,id: cat.id, color: cat.color,togo: 1,),
        ).toList() ,
        
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1/1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        
      )
    ;
  }
}