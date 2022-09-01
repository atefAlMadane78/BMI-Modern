import 'package:flutter/material.dart';
import '../contant.dart';

class icon_content extends StatelessWidget {
  final IconData icon;
  final String label;

  const icon_content({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: const Color(0xFF8D8E98),
              size: 80.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              label,
              style: labeltextstyle,
            )
          ]),
    );
  }
}
