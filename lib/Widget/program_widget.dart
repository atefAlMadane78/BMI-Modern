import 'package:flutter/material.dart';
import 'package:x2/Widget/sport_item.dart';
import '../program_data.dart';


class program_widget extends StatelessWidget {
  const program_widget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 

       GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children:PROGRAMS
        .map((cat) =>
          sport_item( title: cat.title,id: cat.id, color: cat.color,togo: 2,),
        ).toList() ,
        
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 2/1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        
      )
    ;
  }
}