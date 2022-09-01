

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitle{
  static getTitleDate() => FlTitlesData(
    show: true,
    bottomTitles:  AxisTitles(
      axisNameWidget: Text("Date"),
      sideTitles: SideTitles(
        showTitles: true,
        interval: 2,
        //reservedSize: 100,
        getTitlesWidget: (value,v){
          switch(value.toInt()){
            case 1: return Text("1");
            case 10: return Text("10");
            case 20: return Text("20");
            case 28: return Text("28");
          }
          return Text("");
        }
      ),
    ),

    leftTitles:  AxisTitles(
      axisNameWidget: Text("BMI & BMR"),
      sideTitles: SideTitles(
        showTitles: true,
        interval: 2,
        //reservedSize: 100,
        getTitlesWidget: (value,v){
          switch(value.toInt()){
            case 12: return Text("12");
            case 15: return Text("15");
            case 18: return Text("18");
            case 22: return Text("22");
            case 28: return Text("28");
          }
          return Text("");
        }
      ),
    ),
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: AxisTitles(sideTitles:SideTitles(showTitles: false) ),
  );
}