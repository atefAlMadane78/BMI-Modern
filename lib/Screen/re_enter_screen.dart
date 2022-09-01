import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widget/bmi_calc.dart';
import '../Widget/icon_content.dart';
import '../Widget/square.dart';
import '../Widget/gender.dart';
import '../contant.dart';
import '../moduals/myprovider.dart';

class re_enter_screen extends StatefulWidget {
  static const routeName = 're_enter_screen';

  final bool where_come;

  const re_enter_screen(this.where_come);

  @override
  State<re_enter_screen> createState() => _re_enter_screenState();
}

class _re_enter_screenState extends State<re_enter_screen> {
  late Gender selectedgender = Gender.female;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(title:const Text("Re Enter Info"),
      backgroundColor: const Color.fromARGB(255, 148, 71, 155),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                "images/TLogo.png",
                
              ),
              
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              width: double.maxFinite,  
              decoration:const BoxDecoration(
             //   gradient: grad_color,
                //color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedgender = Gender.male;
                            });
                          },
                          child: Container(
                            child: const icon_content(
                                icon: Icons.male, label: "Male"),
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: selectedgender == Gender.male
                                  ? inactivecolorcard
                                  : activecolorcard,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        /*square(
                            colour: selectedgender == Gender.male
                                ? inactivecolorcard
                                : activecolorcard,
                            cardchild:
                                const icon_content(icon: Icons.male, label: "Male"),
                            onpress: () {
                              SchedulerBinding.instance!.addPostFrameCallback((_) {
                                setState(() {
                                  selectedgender = Gender.male;
                                });
                              });
                            }),*/
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedgender = Gender.female;
                            });
                          },
                          child: Container(
                            child: const icon_content(
                                icon: Icons.male, label: "Female"),
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: selectedgender == Gender.female
                                  ? inactivecolorcard
                                  : activecolorcard,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        /*square(
                            colour: selectedgender == Gender.female
                                ? inactivecolorcard
                                : activecolorcard,
                            cardchild: const icon_content(
                                icon: Icons.female, label: "Female"),
                            onpress: () {
                              SchedulerBinding.instance!.addPostFrameCallback((_) {
                                setState(() {
                                  selectedgender = Gender.female;
                                });
                              });
                            }),*/
                      ),
                    ],
                  ),
                  square(
                      colour: activecolorcard,
                      cardchild: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Height',
                              style: labeltextstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              //cross...baseline that to make a small item on the same line(level) with the big item
                              //like a number180 and cm
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: lablenumberstyle,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'cm',
                                  style: labeltextstyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              //you can copy this and pasted in main in theme ....
                              //that to make all slider take the same theme i give it here without rewrite all this in bottom
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: const Color(0xFF8D8E98),
                                activeTrackColor: Colors.purple[300],
                                thumbColor: const Color(0xFFEB1555),
                                //circle color in slider
                                overlayColor: const Color(0x29EB1555),
                                //color in behaend of circle slider that show up when you tap on the circle
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                //to change radius circle
                                overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                //value circle that behaend circle (handle)
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,

                                // active and inactivecolor that prorerty from widget Silder
                                onChanged: (double newvalue) {
                                  // variable newvalue must be a double datdtype
                                  //newvalue its value return from the silder when moveing by user
                                  //we must use setstate method to rebuild a page
                                  setState(() {
                                    height = newvalue.round();
                                    //.round() to convert from double to int (actually from datatype belong to
                                    //right varaiable to datatype on the leftvariable)
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      onpress: () {}),
                  Row(
                    children: [
                      Expanded(
                        child: square(
                          colour: activecolorcard,
                          cardchild: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Weight',
                                    style: labeltextstyle,
                                  ),
                                  Text(
                                    weight.toString(),
                                    style: lablenumberstyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      /*    round_icon(
                                        icon: Icons.access_time,
                                        onprrssed: () {
                                          SchedulerBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              weight--;
                                            });
                                          });
                                        },
                                      ),*/
                                      RawMaterialButton(
                                        child:
                                            const Icon(Icons.exposure_minus_1),
                                        fillColor: const Color(0xFF4F4C5E),
                                        shape: const CircleBorder(),
                                        constraints:
                                            const BoxConstraints.tightFor(
                                          width: 38.0,
                                          height: 38.0,
                                        ),
                                        elevation: 6.0,
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      RawMaterialButton(
                                        child: const Icon(Icons.plus_one),
                                        fillColor: const Color(0xFF4F4C5E),
                                        shape: const CircleBorder(),
                                        constraints:
                                            const BoxConstraints.tightFor(
                                          width: 38.0,
                                          height: 38.0,
                                        ),
                                        elevation: 6.0,
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                      ),
                                      /* round_icon(
                                        icon: Icons.plus_one,
                                        onprrssed: () {
                                          SchedulerBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              weight++;
                                            });
                                          });
                                        },
                                      ),*/
                                    ],
                                  )
                                ]),
                          ),
                          onpress: () {},
                        ),
                      ),
                      Expanded(
                        child: square(
                            colour: activecolorcard,
                            cardchild: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Age',
                                      style: labeltextstyle,
                                    ),
                                    Text(
                                      age.toString(),
                                      style: lablenumberstyle,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        /*  round_icon(
                                          icon: Icons.alarm_add_sharp,
                                          onprrssed: () {
                                            SchedulerBinding.instance!
                                                .addPostFrameCallback((_) {
                                              setState(() {
                                                age--;
                                              });
                                            });
                                          },
                                        ),*/
                                        RawMaterialButton(
                                          child: const Icon(
                                              Icons.exposure_minus_1),
                                          fillColor: const Color(0xFF4F4C5E),
                                          shape: const CircleBorder(),
                                          constraints:
                                              const BoxConstraints.tightFor(
                                            width: 38.0,
                                            height: 38.0,
                                          ),
                                          elevation: 6.0,
                                          onPressed: () {
                                            setState(() {
                                              age--;
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        /* round_icon(
                                          icon: Icons.plus_one,
                                          onprrssed: () {
                                            /*  Future<void> _incrementCounter() async {
                                              setState(() {
                                                age++;
                                              });
                                            }*/
                                            WidgetsBinding.instance!
                                                .addPostFrameCallback(
                                                    (_) => setState(() {
                                                          age++;
                                                        }));
                                            /*SchedulerBinding.instance!
                                              .addPostFrameCallback((_) {
                                                setState(() {
                                                  age++;
                                                });});*/
                                          },
                                        ),*/
                                        RawMaterialButton(
                                          child: const Icon(Icons.plus_one),
                                          fillColor: const Color(0xFF4F4C5E),
                                          shape: const CircleBorder(),
                                          constraints:
                                              const BoxConstraints.tightFor(
                                            width: 38.0,
                                            height: 38.0,
                                          ),
                                          elevation: 6.0,
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          },
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                            onpress: () {}),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 50),
                        //  margin: const EdgeInsets.all(20),
                        child: widget.where_come
                            ? const Text(" Save ")
                            : const Text("Save & Regist "),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 212, 114, 221),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onTap: () {
                    //  Navigator.of(context).pop();
                     // Navigator.of(context).pop();
                      final res = bmi_calc(height, weight, age, selectedgender);
                      double bmi = double.parse(res.calcbmi());
                      double bmr = double.parse(res.calcbmr());
                      Provider.of<myprovider>(context, listen: false)
                          .setB(bmi, bmr);
                      Provider.of<myprovider>(context, listen: false)
                          .addBMI(double.parse(res.calcbmi()), 15);
                      Provider.of<myprovider>(context, listen: false)
                          .addBMR(double.parse(res.calcbmr()) / 100, 5);
                      print(Provider.of<myprovider>(context, listen: false)
                          .getlBMI());
                      print(Provider.of<myprovider>(context, listen: false)
                          .getlBMR());

                      final user = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .update({
                        //add to array
                        'bmi': FieldValue.arrayUnion([
                          Provider.of<myprovider>(context, listen: false)
                              .getbmi(),
                        ]),
                        'bmr': FieldValue.arrayUnion([
                          Provider.of<myprovider>(context, listen: false)
                              .getbmr(),
                        ]),
                        // 'bmr':FieldValue.arrayUnion([Provider.of<myprovider>(context, listen: false).BMR,]),
                        // 'bmi': FieldValue.arrayRemove([5]) // remove element
                      }); 
                      // show diaglo to tell user is done
                    /*  Scaffold.of(context).showSnackBar(SnackBar(
                        content: const Text("Done .."),
                        backgroundColor: Colors.green[300],
                      ));*/
                      Navigator.of(context).pop();
                      //Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      /* base_con(height: 1000.0,
       /* margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        width: double.maxFinite,
        height: 1000,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),*/
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Container(
                      child:
                          const icon_content(icon: Icons.male, label: "Male"),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedgender == Gender.male
                            ? inactivecolorcard
                            : activecolorcard,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  /*square(
                      colour: selectedgender == Gender.male
                          ? inactivecolorcard
                          : activecolorcard,
                      cardchild:
                          const icon_content(icon: Icons.male, label: "Male"),
                      onpress: () {
                        SchedulerBinding.instance!.addPostFrameCallback((_) {
                          setState(() {
                            selectedgender = Gender.male;
                          });
                        });
                      }),*/
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: Container(
                      child:
                          const icon_content(icon: Icons.male, label: "Female"),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedgender == Gender.female
                            ? inactivecolorcard
                            : activecolorcard,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  /*square(
                      colour: selectedgender == Gender.female
                          ? inactivecolorcard
                          : activecolorcard,
                      cardchild: const icon_content(
                          icon: Icons.female, label: "Female"),
                      onpress: () {
                        SchedulerBinding.instance!.addPostFrameCallback((_) {
                          setState(() {
                            selectedgender = Gender.female;
                          });
                        });
                      }),*/
                ),
              ],
            ),
            square(
                colour: activecolorcard,
                cardchild: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Height',
                        style: labeltextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        //cross...baseline that to make a small item on the same line(level) with the big item
                        //like a number180 and cm
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: lablenumberstyle,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'cm',
                            style: labeltextstyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        //you can copy this and pasted in main in theme ....
                        //that to make all slider take the same theme i give it here without rewrite all this in bottom
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          activeTrackColor: Colors.purple[300],
                          thumbColor: const Color(0xFFEB1555),
                          //circle color in slider
                          overlayColor: const Color(0x29EB1555),
                          //color in behaend of circle slider that show up when you tap on the circle
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          //to change radius circle
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          //value circle that behaend circle (handle)
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,

                          // active and inactivecolor that prorerty from widget Silder
                          onChanged: (double newvalue) {
                            // variable newvalue must be a double datdtype
                            //newvalue its value return from the silder when moveing by user
                            //we must use setstate method to rebuild a page
                            setState(() {
                              height = newvalue.round();
                              //.round() to convert from double to int (actually from datatype belong to
                              //right varaiable to datatype on the leftvariable)
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                onpress: () {}),
            Row(
              children: [
                Expanded(
                  child: square(
                    colour: activecolorcard,
                    cardchild: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Weight',
                              style: labeltextstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: lablenumberstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                /*    round_icon(
                                  icon: Icons.access_time,
                                  onprrssed: () {
                                    SchedulerBinding.instance!
                                        .addPostFrameCallback((_) {
                                      setState(() {
                                        weight--;
                                      });
                                    });
                                  },
                                ),*/
                                RawMaterialButton(
                                  child: const Icon(Icons.exposure_minus_1),
                                  fillColor: const Color(0xFF4F4C5E),
                                  shape: const CircleBorder(),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 38.0,
                                    height: 38.0,
                                  ),
                                  elevation: 6.0,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RawMaterialButton(
                                  child: const Icon(Icons.plus_one),
                                  fillColor: const Color(0xFF4F4C5E),
                                  shape: const CircleBorder(),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 38.0,
                                    height: 38.0,
                                  ),
                                  elevation: 6.0,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                /* round_icon(
                                  icon: Icons.plus_one,
                                  onprrssed: () {
                                    SchedulerBinding.instance!
                                        .addPostFrameCallback((_) {
                                      setState(() {
                                        weight++;
                                      });
                                    });
                                  },
                                ),*/
                              ],
                            )
                          ]),
                    ),
                    onpress: () {},
                  ),
                ),
                Expanded(
                  child: square(
                      colour: activecolorcard,
                      cardchild: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Age',
                                style: labeltextstyle,
                              ),
                              Text(
                                age.toString(),
                                style: lablenumberstyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  /*  round_icon(
                                    icon: Icons.alarm_add_sharp,
                                    onprrssed: () {
                                      SchedulerBinding.instance!
                                          .addPostFrameCallback((_) {
                                        setState(() {
                                          age--;
                                        });
                                      });
                                    },
                                  ),*/
                                  RawMaterialButton(
                                    child: const Icon(Icons.exposure_minus_1),
                                    fillColor: const Color(0xFF4F4C5E),
                                    shape: const CircleBorder(),
                                    constraints: const BoxConstraints.tightFor(
                                      width: 38.0,
                                      height: 38.0,
                                    ),
                                    elevation: 6.0,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  /* round_icon(
                                    icon: Icons.plus_one,
                                    onprrssed: () {
                                      /*  Future<void> _incrementCounter() async {
                                        setState(() {
                                          age++;
                                        });
                                      }*/
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback(
                                              (_) => setState(() {
                                                    age++;
                                                  }));
                                      /*SchedulerBinding.instance!
                                        .addPostFrameCallback((_) {
                                          setState(() {
                                            age++;
                                          });});*/
                                    },
                                  ),*/
                                  RawMaterialButton(
                                    child: const Icon(Icons.plus_one),
                                    fillColor: const Color(0xFF4F4C5E),
                                    shape: const CircleBorder(),
                                    constraints: const BoxConstraints.tightFor(
                                      width: 38.0,
                                      height: 38.0,
                                    ),
                                    elevation: 6.0,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ]),
                      ),
                      onpress: () {}),
                ),
              ],
            ),
            InkWell(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  //  margin: const EdgeInsets.all(20),
                  child: const Text("Show Result"),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onTap: () => go_to_res(context, title),
            )
          ],
        ),
      ),*/
      // backgroundColor: Colors.black,
    );
  }
}
