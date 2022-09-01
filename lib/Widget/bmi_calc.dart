import 'dart:math';

import 'package:x2/Widget/gender.dart';

class bmi_calc{

bmi_calc(this.height, this.weight, this.age, this.gender);

final  height;
final  weight;
final age;
final gender;

double _bmi =0;
double _bmr =0 ;

String calcbmi(){
  _bmi = weight/pow(height/100, 2);
  return _bmi.toStringAsFixed(1);
  //to selected number of number after . in double bmi
}

String calcbmr(){
      if(gender == Gender.male){
        _bmr = 88.362 + (13.397 * weight) +(4.799 * height) - (5.677 *age);
        return _bmr.toStringAsFixed(2);
      }
      else{
        _bmr = 447.593 + (9.274 * weight) + (3.098 * height) - (4.330 * age)  ;
        return _bmr.toStringAsFixed(2);
      }
   
}

String gotresult(){
  if(_bmi >= 25){
  
    return 'OverWieght';

  }else if(_bmi > 18.5){
    return 'Normal';
  }else{
    return 'UnderWeight';
  }
}

String getinterpation(){
  if(_bmi >= 25){
    return 'You have a higher than noraml body weight . Try ti excercise more.';

  }else if(_bmi > 18.5){
    return 'You have a normal body weight . Good job.';
  }else{
    return 'Your BMI result is quite low you sholud eat more.';
  }
}

}