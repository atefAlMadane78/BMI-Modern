import 'package:flutter/material.dart';
import 'package:x2/contant.dart';
import '../Widget/base_con.dart';
import '../Widget/sport_widget.dart';

class sport_screen extends StatelessWidget {
  static const routeName = 'sport_screen';

  const sport_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArg['title'];

    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title!),
        backgroundColor:const Color.fromARGB(255, 212, 114, 221),
          elevation: 0,
      ),
      body: //base_con(child: sport_widget(), height: 1000.0),
           Column(
                  children: [
                   
            Image.asset("images/TLogo.png"),
            Expanded(
              child:Container(
                child: const sport_widget(),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                width: double.maxFinite,
                decoration:const BoxDecoration(
                //  gradient: grad_color,
              //    color: Colors.pink[50],
             // color: Colors.white,
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
              ),
            ),
                  ],
                ),
          )
    ;
  }
}
