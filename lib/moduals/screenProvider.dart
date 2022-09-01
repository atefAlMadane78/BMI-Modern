import 'package:flutter/material.dart';
//import 'package:x2/1.2%20dummy_data.dart';
import 'package:x2/content/DD2.dart';
import 'package:x2/program_data.dart';
import 'package:intl/intl.dart';
import '../content/DD.dart' as dd;
import '../1.2 dummy_data.dart' as d;

class screenProvider with ChangeNotifier {
  var meals;
var date = DateTime.now();
 var day;
var exr;


  List putmeal() {
   day =DateFormat('d').format(date); 
   
   /*if(day == "6"){print(day.runtimeType);print("eeeeeeeeeeeeeeeeee");}
    meals = PROGRAMS.where((element) {
      return element.id.contains('md');
    }).toList();*/
   //print(day);
   if( day == "1" || day == "8" || day == "15"  || day == "22" || day == "30" ){
    
     meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c1');
    }).toList();
    /*meals =meals +  d.DUMMY_MEALS.where((element) {
      return element.id.contains('m222');
    }).toList();*/
   }
   if( day == "2" || day == "9" || day == "16" || day == "23" || day =="30" ){
       meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c2');
    }).toList();
   }
   if( day == "3" || day == "10" || day == "17" || day == "24" || day =="31" ){
      meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c4');
    }).toList();
   }
   if( day == "4" || day == "11" || day == "18" || day == "25"  ){
    meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c5');
    }).toList();
   }
   if( day == "5" || day == "12" || day == "19" || day == "26"  ){
     meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c6');
    }).toList();
    meals =meals +  d.DUMMY_MEALS.where((element) {
      return element.id.contains('c7');
    }).toList();
   }
   if( day == "6" || day == "13" || day == "20" || day == "27"  ){
      meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c3');
    }).toList();
    meals =meals +  d.DUMMY_MEALS.where((element) {
      return element.id.contains('c8');
    }).toList();
   }
   if( day == "7" || day == "14" || day == "21" || day == "28"  ){
       meals = d.DUMMY_MEALS.where((element) {
      return element.categories.contains('c9');
    }).toList();
   }
   
    
    notifyListeners();
    return meals;
  }
  
  List putexr() {
   day =DateFormat('d').format(date); 
   
   
   if( day == "1" || day == "8" || day == "15"  || day == "22" || day =="30" ){
       exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "2" || day == "9" || day == "16" || day == "23" || day =="30" ){
      exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "3" || day == "10" || day == "17" || day == "24" || day =="31" ){
      exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "4" || day == "11" || day == "18" || day == "25"  ){
      exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "5" || day == "12" || day == "19" || day == "26"  ){
      exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "6" || day == "13" || day == "20" || day == "27"  ){
      exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   if( day == "7" || day == "14" || day == "21" || day == "28"  ){
    exr = dd.DUMMY_MEALS.where((element) {
      return element.id.contains('m1');
    }).toList();
   }
   
    
    notifyListeners();
    return exr;
  }
}




/*
  var meals , now;
int i=0;
List m=['md', 'dd','ww'];
  List putmeal(String str) {
    meals = PROGRAMS.where((element) {
      return element.id.contains(str);
    }).toList();
    notifyListeners();
    return meals;
  }

  List tt() {
    Timer.periodic(Duration(seconds: 2), (timer) {
     now= putmeal(m[i]).toList();
      i++;
      if(i > 2){
        i=0;
      }
    });
    return now;
  }
*/