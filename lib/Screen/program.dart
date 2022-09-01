import 'package:flutter/material.dart';
import 'package:x2/Widget/base_con.dart';
import 'package:x2/Widget/sport_widget.dart';

import '../Widget/program_widget.dart';

class program extends StatelessWidget {
  static const routeName = 'program_screen';

  const program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArg['title'];
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 218, 164, 223),
        title: Text(title!),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 1,
            left: 40,
            child: Image.asset("images/TLogo.png",
            
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 125),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            width: double.maxFinite,
            child: const program_widget(),
            decoration:const BoxDecoration(
              
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),

            //color: Colors.white,
          )
        ],
      ),
    );
  }
}
