import 'package:flutter/material.dart';

class doing_screen extends StatelessWidget {
  static const routeName = 'doing_screen';

  const doing_screen({Key? key}) : super(key: key);
  Widget oneship(String name, double left, double right, int shape, String img) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
                decoration: BoxDecoration(
                  //  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 148, 71, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: shape == 1
                    ? EdgeInsets.only(left: left, top: 50, right: right)
                    : EdgeInsets.only(left: right, top: 50, right: left),
                // padding: const EdgeInsets.all(50),
                height: 90,
                width: 500,
                child: Center(child: Text(name))),
          ),
          if (shape == 1)
             Positioned(
              top: 20,
              left: 45,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(img),
              ),
            ),
          if (shape == 2)
             Positioned(
              top: 20,
              left: 275,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(img),
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 148, 71, 155),
          title: const Text("Develpoers"),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                  //  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
                padding: const EdgeInsets.only(top: 20, left: 25),
                height: 125,
                width: 500,
                child: const Text(
                    "Contact Us \n \n Mobile :  +963 960024240\n\n Email :  atef@gmail.com")),
            oneship("Atef Al_Madane", 75.0, 25.0, 1 ,"images/a.jpg"),
            oneship("Yara Al_Hassan", 75.0, 25.0, 2,"images/M.jpg"),
            oneship("Mousa Bakhos", 75.0, 25.0, 1,"images/mo.jpg"),
            oneship("Ibrahem Al_Khoury", 75.0, 25.0, 2,"images/ib.jpg"),
          ],
        ));
  }
}
