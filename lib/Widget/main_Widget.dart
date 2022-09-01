// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:x2/Screen/program.dart';
import 'package:x2/content/tab_screen.dart';
import '../Screen/bmi_Screen.dart';
import '../Screen/sport_screen.dart';


class main_Widget extends StatelessWidget {

late String title;
late Color color ;
late int n;

main_Widget(this.title , this.color, this.n ,{Key? key}  ) : super(key: key) ;
  
void selecitem (BuildContext ctx){
  if(n == 1 ){
  Navigator.of(ctx).pushNamed(bmi_Screen.routeName,
  arguments: {'title' : title,}
  );}
  else if(n == 2 ){
    Navigator.of(ctx).pushNamed(sport_screen.routeName,
    arguments: {
      'title' : title,
    }
    );
  }
  else if(n == 3){
    Navigator.of(ctx).pushNamed(program.routeName,
    arguments: {
      'title' : title,
    }
    );
  }
  else{
     Navigator.of(ctx).pushNamed(tab_screen1.routeName,
    arguments: {
      'title' : title,
    }
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecitem(context),
      child: Container(
        width: 200,
        padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 50),
      //  margin: const EdgeInsets.all(20),
        child: Center(child: Text(title, softWrap: false,
                    )),
        decoration:BoxDecoration(
           color : color,
           borderRadius: BorderRadius.circular(10),
        ), 
       

      ),
    );
  }
}