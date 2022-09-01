import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class myprovider with ChangeNotifier {
  double BMR = 0.0, BMI = 0.0;
  List<FlSpot> lbmi = [];
  List<FlSpot> lbmr=[];
   //Timer? timer;
  // int i =0;
  
  void addBMI(double bmi, double date) {
    print("hhhhhhhhhhhhh");
    lbmi.add(FlSpot(bmi, date));
    notifyListeners();
  }

   void addBMR(double bmr, double date) {
    lbmr.add(FlSpot(bmr, date));
    notifyListeners();
  }

  List<FlSpot> getlBMI() {
    return lbmi;
  }

  List<FlSpot> getlBMR(){
    return lbmr;
    
  }
/*
  void startTimer() {
    timer = Timer.periodic(Duration(seconds:1), (timer) {

      print(i);
      i++;
      if( i == 10){
         
      }
    });
    notifyListeners();
  }

  void stopTimer() {
    timer!.cancel();
    print("timer stoppppppppppppppppppp");
    notifyListeners();
  }
*/
  double getbmi() {
    return BMI;
    notifyListeners();
  }

  double getbmr() {
    return BMR;
    notifyListeners();
  }

  void setB(double bmi, double bmr) {
    BMI = bmi;
    BMR = bmr;
    notifyListeners();
  }
}
