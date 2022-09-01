import 'package:flutter/material.dart';
import 'package:x2/contant.dart';

class base_con extends StatelessWidget {
  final Widget child;
 final height;
  const base_con({Key? key, required this.child,required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      width: double.maxFinite,
      height: height,
      child: child,
      decoration: BoxDecoration(
        gradient: grad_color,
        //color: Colors.pink[50],
        borderRadius: BorderRadius.circular(60),
      ),

      //color: Colors.white,
    );
      
  }
}
