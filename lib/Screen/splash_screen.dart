import 'package:flutter/material.dart';

import '../contant.dart';

class splash_Screen extends StatelessWidget {
  static const routeName = 'splash_screen';
  const splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: grad_color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/body.png",
              
              width: 200,
              height: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Loading "),
                SizedBox( width: 25,),
                CircularProgressIndicator(),// another one
              ],
            )
          ],
        ),
      ),
    );
  }
}
