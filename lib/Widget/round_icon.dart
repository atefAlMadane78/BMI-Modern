import 'package:flutter/material.dart';

class round_icon extends StatelessWidget {

  final IconData icon;
  final Function onprrssed;

  const round_icon({ Key? key,required this.icon, required this.onprrssed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      
      child: Icon(icon),
      fillColor: const Color(0xFF4F4C5E),
      shape: const  CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 38.0,
        height: 38.0,
      ),
      elevation: 6.0,
      onPressed: onprrssed(),
    );
  }
}