import 'package:flutter/material.dart';
import 'package:x2/contant.dart';

class square extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  final Function onpress;

  const square(
      {Key? key,
      required this.colour,
      required this.cardchild,
      required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress(),
      child: Container(
        child: cardchild,
         margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: grad_color,
          //color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        ),
    );
  }
}
