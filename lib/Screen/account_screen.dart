import 'dart:async';
import 'package:x2/Screen/final_sport_screen.dart';

import '../Screen/re_enter_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x2/moduals/screenProvider.dart';
import '../Widget/move_sport.dart';
import '../Widget/sport_item.dart';
import '../content/meal_item.dart';
import '../moduals/myprovider.dart';
import '../program_data.dart';

class account_Screen extends StatefulWidget {
  static const routeName = 'account_Screen';
  const account_Screen({Key? key}) : super(key: key);

  @override
  State<account_Screen> createState() => _account_ScreenState();
}

class _account_ScreenState extends State<account_Screen> {
  /*@override
  void initState() {
  super.initState();
      Provider.of<myprovider>(context, listen: false).startTimer();

  }*/
/*
  //  for reenter scren
  Timer? timer ;
  int i=0;
  void initState(){
    super.initState();
    timer = Timer.periodic(const Duration(seconds:1), (timer) {

      print(i);
      i++;
      if( i == 30){
         Navigator.of(context).pushNamed(re_enter_screen.routeName);
         timer.cancel();
         
      }
    });
    
  }*/

  @override
  Widget build(BuildContext context) {
    /*  final meals , exr;
   WidgetsBinding.instance!.addPostFrameCallback((_) {
     
     
    });*/
    final meals = Provider.of<screenProvider>(context, listen: false).putmeal();

    final exr = Provider.of<screenProvider>(context, listen: false).putexr();

    return Scaffold(
      //backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text("data"),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Log Out"),
                  ],
                ),
                value: 'logout',
              )
            ],
            onChanged: (ItemIdentfier) {
              if (ItemIdentfier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),*/
      body: StreamBuilder<QuerySnapshot>(
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

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                     // color: Colors.white,
                      shadowColor: Colors.black54,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (res.isNotEmpty)
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(res[0]['image_url']),
                              ),
                            if (res.isNotEmpty)
                              Text("Welcome " +
                                  res[0]['username'] +
                                  '\n Are You ready for today ....'),
                            if (res.isEmpty) const CircularProgressIndicator(),
                          ],
                        ),
                      ),
                      elevation: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text("Exercise",
                     style: TextStyle(
                 // color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),),
                  ),
                  Container(
                      decoration: BoxDecoration(
                       // color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      child: meals.isNotEmpty
                          ? GridView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(20.0),
                              children: meals
                                  .map(
                                    (cat) => move_sport(
                                      id: cat.id,
                                      imgUrl: cat.imageUrl,
                                      complexity: cat.complexity,
                                      title: cat.title,
                                      affordability: cat.affordability,
                                      duration: cat.duration,
                                      n: 2,
                                    ),
                                    /*final_Sport_screen(
                                //title: cat.title,
                                id: cat.id,
                               // color: cat.color,
                               // togo: 1,
                              ),*/
                                  )
                                  .toList(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 1 / 1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                            )
                          : const Center(child: Text("Today Is Rest"))),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      "Meals",
                     style: TextStyle(
                 // color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                       // color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      child: GridView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20.0),
                        children: exr
                            .map(
                              (cat) => Meal_item(
                                title: cat.title,
                                id: cat.id,
                                imageUrl: cat.imageUrl,
                                calories: cat.calories,
                                ingredients: cat.ingredients,
                                where: 2,
                              ),
                            )
                            .toList(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                      ))
                ],
              ),
            );

            /*    return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (ctx, index) {
                if (docs[index]['userID'] == user!.uid) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            shadowColor: Colors.black54,
                            child: Container(     
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 120,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(docs[index]['image_url']),
                                  ),
                                  Text("Welcome " +
                                      docs[index]['username'] +
                                      '\n Are You ready for today ....'),
                                ],
                              ),
                              color: Colors.white,
                            ),
                            elevation: 8,
                          ),
                        ),
                        const SizedBox( height: 25,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          margin: EdgeInsets.all(8),
                          child: Text("meals"),
                        ),
                        const SizedBox( height: 25,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          margin: EdgeInsets.all(8),
                          child: Text("Movess"),
                        )
                      ],
                    ),
                  );
                } else {
                  return Text("");
                }
              },
            );*/
          }),

      /* ListView.builder(
          itemCount: 2,
          itemBuilder: (ctx, index) {
            var username = "test";
            var  userimage;
            final user = FirebaseAuth.instance.currentUser;
            final doc = FirebaseFirestore.instance
                .collection("users")
                .snapshots()
                .listen((event) {
              event.docs.forEach((element) {
                if (user!.uid == element['userID']) {
                  username = element['username'];
                  print(username);
                  userimage = element['image_url'];
                }
              });
            });
            
            return Column(
              children: [
                Text(username),

              ],
            );
          },
        )*/

      /*
         FloatingActionButton(
          child: Text("data"),
          onPressed: (){
            var index;
             final user  =FirebaseAuth.instance.currentUser ;
          final doc=  FirebaseFirestore.instance.collection("users").snapshots().listen((event) {
            event.docs.forEach((element) {
              if( user!.uid == element['userID']){
                index = element['username'];
                print(element['username']);
              }
            });
            
          });
              
          },)
        */
    );
  }
}
