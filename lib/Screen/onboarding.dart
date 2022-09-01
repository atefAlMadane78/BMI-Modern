import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x2/contant.dart';

import '../Widget/Indicator.dart';

class onboarding extends StatefulWidget {
   static const routeName = 'onboarding';
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/666.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child:
                      Image.asset('images/TLogo.png')
                      /* const Text(
                        "BMI Modern ",
                        style: 
                        titletext  
                        ,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),*/
                    ),
                  ],
                ),
              ),
                Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/555.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "Helps you lose weight",
                        style: bodytextstyle,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/444.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "You can create an account",
                        style: bodytextstyle,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/333.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "You can enjoy by browsing the varieties of dishes and the calories they contain ",
                        style: bodytextstyle,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            
               Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/222.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "You can watch and learn different muscle exercises",
                        style: bodytextstyle,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
               Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("images/111.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "You can enjoy the night mode",
                        style: bodytextstyle,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    
                  ],
                ),
              ),
              
            ],
            onPageChanged: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
          ),
          Indicator(_currentIndex),
          Builder(
            builder: (ctx) => Align(
              alignment:const Alignment(0, 0.85),
              child: Container(
                width: double.infinity,
                margin:const EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  padding:const EdgeInsets.all(7),
                  color: const Color.fromARGB(255, 194, 86, 204),
                  child: const Text(
                    "Start",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    /*Navigator.of(context).pushReplacementNamed();

                   SharedPreferences prefs = await SharedPreferences.getInstance();
                   prefs.setBool('watched', true);
                   */
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
