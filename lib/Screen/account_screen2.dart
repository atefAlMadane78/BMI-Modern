import 'dart:async';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x2/moduals/myprovider.dart';
import '../moduals/LineTitle.dart';

class account_screen2 extends StatelessWidget {
  var date = <dynamic>[];
  var bmi = <dynamic>[];
  var bmr = <dynamic>[];
  int i = 0;
  int j =0 ;
  int i1=-1;
  int j1=-1;
  //var d = [];
  var ress1 = <FlSpot>[];
  var ress2 = <FlSpot>[];
  void pp1() {
    for (i; i < bmi.length; i++) {
      
    //  i1++;
     //if(i1 == 4){ i1=0;}
      ress1.add(FlSpot( date[i],bmi[i]));

    }
    print("resssssssssssss");
    print(ress1);
  }
   void pp2() {
    for (j; j < bmi.length; j++) {
      //j1++;
    //  if(j1 == 4){ j1=0;}
      ress2.add(FlSpot( date[j],bmr[j] / 100));

    }
    print("resssssssssssss2222222222");
    print(ress2);
  }

  @override
  Widget build(BuildContext context) {
//var i =0 ;
    int j = -1, i = -1;
    FlSpot put() {
      i++;
      j++;
      if (j == 4) {
        j = 0;
      }
      return FlSpot(date[j], bmi[i]);
    }

    int jj = -1, ii = -1;
    FlSpot put2() {
      ii++;
      jj++;
      if (jj == 4) {
        jj = 0;
      }

      return FlSpot(date[jj], bmr[ii] % 100);
    }

    FlSpot rec(int n) {
      /*while(n != 0){
        put();
        }
       return FlSpot(date[n], bmr[n] % 100);*/

      if (n == 0) {
        return put();
      } else {
        put();
        return rec(n - 1);
      }
    }

    FlSpot rec2(int n) {
      if (n == 0) {
        return put2();
      } else {
        put2();
        return rec(n - 1);
      }
    }

    /*WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Provider.of<myprovider>(context, listen: false)
                          .stopTimer();
                    });*/
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final docs = snapshot.data!.docs;
          final user = FirebaseAuth.instance.currentUser;
          final res = docs.where(
            (element) {
              return element['userID'] == user!.uid;
            },
          ).toList();

          res.forEach(
            (element) {
              date = (element["date"]);
              bmi = (element['bmi']);
              bmr =( element['bmr']   );
              pp1();
              pp2();
              //Provider.of<myprovider>(context, listen: false).addBMI(bb,5.0 );
              // b=element['bmi'];
            },
          );
          // print(bmi);
          // print(bmr);

          //  print(Provider.of<myprovider>(context , listen: false).getlBMI());

          return Column(
            children: [
              /*0Text(res[0]['bmi'][0].toString()),
              Text(res[0]['bmr'][0].toString()),*/
              Image.asset(
                "images/logo.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Container(
                // color: Colors.white,
                alignment: Alignment.center,
                //margin: const EdgeInsets.all(8),
                width: double.infinity,
                height: 350,
                child: Card(
                  // color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.black54,
                  child: LineChart(LineChartData(
                    minX: 1,
                    maxX: 31,
                    minY: 1,
                    maxY: 50,
                    titlesData: LineTitle.getTitleDate(),
                    gridData: FlGridData(
                      horizontalInterval: 2,
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color:const Color.fromARGB(255, 218, 164, 223), //Colors.amber,
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: true,
                      verticalInterval: 2,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color:Color.fromARGB(255, 242, 127, 255),// Colors.red,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      //border: Border.all(color: Colors.blue, width: 1),
                    ),
                    lineBarsData: [
                      //  we need one for bmi and one for bmr
                      //  if(res.isNotEmpty)
                      LineChartBarData(
                        spots: ress1,

                        /*
                        [
                          put(),
                          put(),
                          put(),
                        ],*/

                        // Provider.of<myprovider>(context, listen: false)
                        //  .getlBMR(),
                        color: Colors.red,
                      ),
                      LineChartBarData(
                        spots: ress2,
                        /*   [
                          
                          put2(),
                          put2(),
                          put2(),
                        ],*/
                        /*   bmr
                            .map(
                              (){
                                
                                return put2();
                              }
                            )
                            .toList(),*/
                        //Provider.of<myprovider>(context, listen: false)
                        // .getlBMI(),

                        // isCurved: true,
                        color: Colors.green,
                        dotData: FlDotData(
                            show: false), // when tap on curve show point axis
                        barWidth: 2,
                        /* belowBarData: BarAreaData(
                          show: true,
                          color: Colors.black54,
                        ),*/
                      ),
                    ],
                  )),
                ),
              ),
            ],
          );
        });
  }
}

class Flspot {}
