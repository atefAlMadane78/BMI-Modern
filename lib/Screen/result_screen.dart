import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:x2/Screen/auth_Screen.dart';
import 'package:x2/Screen/regist.dart';
import 'package:provider/provider.dart';
import 'package:x2/moduals/myprovider.dart';

import '../Widget/base_con.dart';
import '../Widget/bmi_calc.dart';
import '../Widget/square.dart';
import '../contant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/final_program_screen.dart';

class result_screen extends StatelessWidget {
  static const routeName = 'result_screen';

  result_screen({Key? key}) : super(key: key);
  late SharedPreferences _pref;
  setdata() async {
    _pref = await SharedPreferences.getInstance();
    _pref.setBool('where_regist', true);
    bool b = _pref.getBool('where_regist') ?? false;
    print("111111111111111111111");
    print(b);
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final title = routeArg['title'];
    final gender = routeArg['selectedgender'];
    final age = routeArg['age'];
    final height = routeArg['height'];
    final weight = routeArg['weight'];
    final res = bmi_calc(height, weight, age, gender);
    double bmi = double.parse(res.calcbmi());
    double bmr = double.parse(res.calcbmr());
    String resS = "Your BMI Is : " +
        res.calcbmi() +
        "\n" +
        "Your BMR Is : " +
        res.calcbmr();

    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        backgroundColor:const Color.fromARGB(255, 148, 71, 155), 
        elevation: 0,
      ),
     // backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("images/TLogo.png"),
          Expanded(
            child: Container(
              
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              width: double.maxFinite,
              decoration: const BoxDecoration(
               // gradient: grad_color,
              //  color: Colors.white, // Color.fromARGB(255, 148, 71, 155),//Colors.pink[50],
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      // margin: const EdgeInsets.all(10),
                      // padding:const EdgeInsets.all(15.0),
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        'Your Reuslt',
                        style: titletext,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: square(
                      colour:const Color.fromARGB(255, 233, 182, 238),

                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            /*res.calcbmi().toUpperCase(),*/
                            resS,
                            style: resulttext,
                          ),
                          Text(
                            res.gotresult(),
                            style: bmitextstyle,
                          ),
                          Text(
                            res.getinterpation(),
                            textAlign: TextAlign.center,
                            //to put the text in center not on the left side
                            style: bodytextstyle,
                          ),
                        ],
                      ),
                      onpress: () {},
                    ),
                  ),
                  /*InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                      //  margin: const EdgeInsets.all(20),
                      child: const Text("Show Program You Should Follow it."),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),*/
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // select program to read dependes on bmi result
                            // take id from id category in file program
                            if (bmi <= 18) {
                              Navigator.of(context).pushNamed(
                                  final_program_screen.routeName,
                                  arguments: {
                                    'id': 'mc',
                                    'title': 'title',
                                  });
                            }
                            if (bmi > 18 && bmi <= 20) {
                              Navigator.of(context).pushNamed(
                                  final_program_screen.routeName,
                                  arguments: {
                                    'id': 'dd',
                                    'title': 'title',
                                  });
                            }
                            if (bmi > 20 && bmi <= 25) {
                              Navigator.of(context).pushNamed(
                                  final_program_screen.routeName,
                                  arguments: {
                                    'id': 'md2',
                                    'title': 'title',
                                  });
                            }

                            if (bmi > 25) {
                              Navigator.of(context).pushNamed(
                                  final_program_screen.routeName,
                                  arguments: {
                                    'id': 'pbf',
                                    'title': 'title',
                                  });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            //  margin: const EdgeInsets.all(20),
                            child: const Text("Show Program \n to follow it"),
                            decoration: BoxDecoration(
                              color:const Color.fromARGB(255, 212, 114, 221),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<myprovider>(context, listen: false)
                                .setB(bmi, bmr);
                            setdata();
                            Navigator.of(context)
                                .pushReplacementNamed(auth_Screen.routeName);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 23, horizontal: 25),
                            //  margin: const EdgeInsets.all(20),
                            child: const Text("Save Info & Regist"),
                            decoration: BoxDecoration(
                              color:const Color.fromARGB(255, 212, 114, 221),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /* base_con(
          child: base_con(height: 1000.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                   // margin: const EdgeInsets.all(10),
                   // padding:const EdgeInsets.all(15.0),
                    alignment: Alignment.bottomCenter,
                    child:const  Text(
                      'Your Reuslt',
                      style: titletext,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: square(
                    colour: activecolorcard,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          res.calcbmi().toUpperCase(),
                          style: resulttext,
                        ),
                        Text(
                          res.gotresult(),
                          style: bmitextstyle,
                        ),
                        Text(
                          res.getinterpation(),
                          textAlign: TextAlign.center,
                          //to put the text in center not on the left side
                          style: bodytextstyle,
                        ),
                      ],
                    ), onpress: (){},
                  ),
                ),
              InkWell(
                onTap: () {},
                child: Container(
                   padding:   const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                //  margin: const EdgeInsets.all(20),
                  child:const Text("Show Program You Should Follow it."),
                  decoration:BoxDecoration(
             color : Colors.pink,
             borderRadius: BorderRadius.circular(10),
                  ), 
                 
          
                ),
              ),
              ],
            ),
          ),
          height: 1000.0),*/
      // backgroundColor: Colors.black,
    );
  }
}
