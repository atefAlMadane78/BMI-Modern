// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widget/base_con.dart';
import '../Widget/main_Widget.dart';
import '../moduals/themeprovider.dart';

class main_Screen extends StatelessWidget {
   main_Screen({ Key? key, required this.n }) : super(key: key);

  final int n;

  @override
  Widget build(BuildContext context) {

 //Provider.of<themeprovider>(context, listen: false).getThemeMode();
    if(n ==1 )
   {
    return  base_con(height: 400.0,
    child: Column(
        children: [
          main_Widget(" BMI  ",const Color.fromARGB(255, 148, 71, 155),1),
          main_Widget(" Dishes Content",const  Color.fromARGB(255, 194, 86, 204)  ,4),
          main_Widget("Nutrition Programs",const Color.fromARGB(255, 218, 164, 223),3),
          main_Widget("Gymnastics",const Color.fromARGB(255, 212, 114, 221),2),
        ],
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),);}
    else{
      return Container(
        //color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/logo.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
             const SizedBox(height: 100,),
              main_Widget("Dishes Content ", Color.fromARGB(255, 212, 114, 221),4),
              const SizedBox(height: 50,),
              main_Widget(" Gymnastics ",Color.fromARGB(255, 218, 164, 223),3),
              const SizedBox(height: 50,),
              main_Widget("Nutrition Programs ",Color.fromARGB(255, 194, 86, 204),2),
            ],
           //mainAxisAlignment: MainAxisAlignment.spaceAround,
           //crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      );
    }
     /*Container(
      
      margin: const EdgeInsets.symmetric(vertical: 35,horizontal: 15),

      width: double.maxFinite,
      height: 400,
      child: Column(
        children: [
          main_Widget(" Item 1 ", Colors.orange),
          main_Widget(" Item 2 ", Colors.pink),
          main_Widget(" Item 3 ", Colors.green),
          main_Widget(" Item 4 ", Colors.red),
        ],
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      decoration:BoxDecoration(
           color : Colors.white,
           borderRadius: BorderRadius.circular(60),
        ), 
      
      //color: Colors.white,
    );*/
  }
}