import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int index;

  const Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context, 0),
          buildContainer(context, 1),
          buildContainer(context, 2),
          buildContainer(context, 3),
          buildContainer(context, 4),
          buildContainer(context, 5),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext ctx, int i) {
    return index == i
        ? const Icon(
            Icons.star,size: 45,
            color: Color.fromARGB(255, 194, 86, 204),
          )
        : Container(
            margin: const EdgeInsets.all(4),
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 247, 180, 219),
              shape: BoxShape.circle,
            ));
  }
}
