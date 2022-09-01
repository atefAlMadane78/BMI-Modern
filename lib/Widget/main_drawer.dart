import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x2/Screen/auth_Screen.dart';
import 'package:x2/Screen/change_screen.dart';
import 'package:x2/Screen/doing_screen.dart';
import 'package:x2/Screen/onboarding.dart';
import 'package:x2/Screen/program.dart';
import 'package:x2/Screen/re_enter_screen.dart';
import 'package:x2/Screen/splash_screen.dart';
import 'package:x2/moduals/myprovider.dart';
import 'package:x2/moduals/themeprovider.dart';

class main_drawer extends StatefulWidget {
  final bool isaccont;
  const main_drawer({required this.isaccont});

  @override
  State<main_drawer> createState() => _main_drawerState();
}

class _main_drawerState extends State<main_drawer> {
  Widget divider() {
    return const Divider(
      indent: 25,
      endIndent: 25,
      color: Colors.grey,
    );
  }

  bool tm = false;
  bool showadd = false;
  bool rotate = false;

  @override
  Widget build(BuildContext context) {
    bool d_l_mode = false;
    late SharedPreferences _pref;
    // FirebaseAuth.instance.signOut();

    final User? user = FirebaseAuth.instance.currentUser;
    dynamic res;
    if (user != null) {
      /* res = FirebaseFirestore.instance
          .collection('users')
          .where('userID', isEqualTo: user.uid)
          .snapshots();*/
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          final docs = snapshot.data!.docs;
          final user = FirebaseAuth.instance.currentUser;
          final res = docs.where(
            (element) {
              return element['userID'] == user!.uid;
            },
          ).toList();
          return Drawer(
            child: Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      color: Color.fromARGB(255, 148, 71, 155),
                      child: !widget.isaccont
                          ? const Text(
                              "Settings",
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                    if (widget.isaccont && res.isNotEmpty)
                      Positioned(
                        bottom: 3,
                        left: 90,
                        child: Text(res[0]['username']),
                      ),
                    if (res.isEmpty)
                      const Positioned(
                        bottom: 3,
                        left: 90,
                        child: Text("Loading..."),
                      ),
                    if (widget.isaccont)
                      Positioned(
                          bottom: -10,
                          left: 140,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                showadd = !showadd;
                                rotate = !rotate;
                              });
                            },
                            icon: rotate == true
                                ? Transform.rotate(
                                    angle: -1 * 3.14 / 2,
                                    child: const Icon(Icons.arrow_back))
                                : const Icon(Icons.arrow_back),
                          )),
                    if (widget.isaccont && res.isNotEmpty)
                      Positioned(
                        bottom: -20,
                        left: 20,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(res[0]['image_url']),
                          radius: 25,
                        ),
                      ),
                    if (res.isEmpty)
                      const Positioned(
                        bottom: -20,
                        left: 20,
                        child: CircleAvatar(
                          radius: 25,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // you can put this in function to avoid repaid
                if (!widget.isaccont || showadd)
                  ListTile(
                    trailing: !showadd
                        ? const Icon(Icons.account_balance)
                        : const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 148, 71, 155),
                          ),
                    // depend on varaiable that determined if their is account show
                    /*
            if(){
              trailing:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(register.routeName);
                }, icon: const Icon(Icons.arrow)),
            }
            */
                    title: !showadd
                        ? const Text("Regist Now ")
                        : const Text("Add Another Accont "),
                    onTap: () {
                      Navigator.of(context).pushNamed(auth_Screen.routeName);
                    },
                  ),
                if (showadd) divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.mode,
                    color: Color.fromARGB(255, 148, 71, 155),
                  ),
                  title: const Text("Theme Mode"),
                  onTap: () {
                    setState(() {
                      tm = !tm;
                    });
                  },
                ),
                if (tm)
                  Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        buildRadioListTile(ThemeMode.system, "System Theme",
                            Icons.abc, context),
                        buildRadioListTile(ThemeMode.dark, "Dark Theme",
                            Icons.wb_sunny_outlined, context),
                        buildRadioListTile(ThemeMode.light, "Light Theme",
                            Icons.night_shelter_outlined, context),
                      ],
                    ),
                  ),
                divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.exit_to_app,
                    color: Color.fromARGB(255, 148, 71, 155),
                  ),
                  title: const Text("Log Out "),
                  onTap: () {
                    final alert = AlertDialog(
                      title: const Text("BMI Modern Warning  "),
                      content: Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Divider(
                              color: Colors.grey,
                            ),
                            const Text("Are You Sure You Want to Log out ?"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: const Text("Cancel"),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                InkWell(
                                  child: const Text("Okay"),
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (_) {
                          return alert;
                        });
                    // FirebaseAuth.instance.signOut();

                    /*   setState(() {
                      Provider.of<myprovider>(context, listen: false)
                          .stopTimer();
                    });*/
                  },
                ),
                divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.exit_to_app_outlined,
                    color: Color.fromARGB(255, 148, 71, 155),
                  ),
                  title: const Text("Delete Account"),
                  onTap: () async {
                    final alert = AlertDialog(
                      title: const Text("BMI Modern Warning "),
                      content: Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Divider(
                              color: Colors.grey,
                            ),
                            const Text("Are You Sure You Want Delet Account ?"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: const Text("Cancel"),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                InkWell(
                                  child: const Text("Okay"),
                                  onTap: () async {
                                    _pref =
                                        await SharedPreferences.getInstance();

                                    print(user!.uid);
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(user.uid)
                                        .delete();

                                    user.delete();
                                    FirebaseAuth.instance.signOut();
                                    await _pref.remove('userID');
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (_) {
                          return alert;
                        });
                    /*   _pref = await SharedPreferences.getInstance();

                    print(user!.uid);
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .delete();

                    user.delete();
                    FirebaseAuth.instance.signOut();
                    await _pref.remove('userID');*/

                    /*   setState(() {
                      Provider.of<myprovider>(context, listen: false)
                          .stopTimer();
                    });*/
                  },
                ),
                divider(),
                ListTile(
                    trailing: const Icon(
                      Icons.change_circle,
                      color: Color.fromARGB(255, 148, 71, 155),
                    ),
                    title: const Text(" Change Data"),
                    onTap: () {
                      Navigator.of(context).pushNamed(change_screen.routeName);
                    }),
                divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.developer_mode,
                    color: Color.fromARGB(255, 148, 71, 155),
                  ),
                  title: const Text("Dvelopers "),
                  onTap: () {
                    // this must be in timer when finish

                    Navigator.of(context)
                        .pushNamed(doing_screen.routeName)
                        .whenComplete(() {
                      final user = FirebaseAuth.instance.currentUser;

                      /* FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .update({
                        'bmi':
                            Provider.of<myprovider>(context, listen: false).BMI,
                        'bmr':
                            Provider.of<myprovider>(context, listen: false).BMR,
                      });*/
                    });
                    /* final bb =Provider.of<myprovider>(context, listen: false).BMI;
                    print(bb);
                          FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .update({
                            //add to array
                        'bmi': FieldValue.arrayUnion([Provider.of<myprovider>(context, listen: false)
                          .getlBMI()]),
                        // 'bmr':FieldValue.arrayUnion([Provider.of<myprovider>(context, listen: false).BMR,]),
                       // 'bmi': FieldValue.arrayRemove([5]) // remove element 
                      });*/
                    // must store bmi and bmr variable in provider and use it
                  },
                ), divider(),
                 ListTile(
                    trailing: const Icon(
                      Icons.repeat_one_outlined,
                      color: Color.fromARGB(255, 148, 71, 155),
                    ),
                    title: const Text("Re Enter Info"),
                    onTap: () {
                      Navigator.of(context).pushNamed(re_enter_screen.routeName);
                    }),
              ],
            ),
          );
        },
      );
    }

    //  print(b);

    /* FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        
        print('User is currently signed out!');
      } else {
        b = true;
         res = FirebaseFirestore.instance
            .collection('users')
            .where('userID', isEqualTo: user.uid)
            .snapshots();
        
      }
    });*/

    /* 
          print(res);*/

    /* return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
          final List<QueryDocumentSnapshot<Object?>> docs = snapshot.data!.docs;
          */

/*
         final List<QueryDocumentSnapshot<Object?>> res1 = docs.where(
            (element) {
              return element['userID'] == user!.uid;
            },
          ).toList();
*/

/*
          docs.forEach((element) {
            if(element['userID'] == user!.uid){
             
            }
          },);
*/

    /*
          if (docs.isNotEmpty) {
            
          }
*/
    else {
      return Drawer(
        //child: Text("data")
/*
        child:ListView.builder(
              itemCount:1,
              itemBuilder: (ctx,index){
                if(b)
                return Text(res[index]['username']) ;
               else
               return Text("data");
              },
            ),*/

        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  color: const Color.fromARGB(255, 212, 114, 221),
                  child: !widget.isaccont
                      ? const Text(
                          "Settings",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47, 78, 94),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                /*  if (widget.isaccont)
                  Positioned(
                    bottom: 3,
                    left: 90,
                    child: b ? Text(res[0]['username']) : Text("data"),
                  ),*/
                if (widget.isaccont)
                  Positioned(
                      bottom: -10,
                      left: 140,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showadd = !showadd;
                          });
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: const Color.fromARGB(255, 148, 71, 155),
                      )),
                if (widget.isaccont)
                  const Positioned(
                    bottom: -20,
                    left: 20,
                    child: CircleAvatar(
                      backgroundImage: null,
                      radius: 25,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // you can put this in function to avoid repaid
            if (!widget.isaccont || showadd)
              ListTile(
                trailing: !showadd
                    ? const Icon(
                        Icons.how_to_reg,
                        color: Color.fromARGB(255, 148, 71, 155),
                      )
                    : const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 148, 71, 155),
                      ),
                // depend on varaiable that determined if their is account show
                /*
            if(){
              trailing:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(register.routeName);
                }, icon: const Icon(Icons.arrow)),
            }
            */
                title: !showadd
                    ? const Text("Regist Now ")
                    : const Text("Add Another Accont "),
                onTap: () {
                  Navigator.of(context).pushNamed(auth_Screen.routeName);
                },
              ),
            if (showadd) divider(),
            divider(),
            ListTile(
              trailing: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 148, 71, 155),
              ),
              title: const Text("Theme Mode"),
              onTap: () {
                setState(() {
                  tm = !tm;
                });
              },
            ),
            if (tm)
              Container(
                color: Colors.black12,
                child: Column(
                  children: [
                    buildRadioListTile(
                        ThemeMode.system, "System Theme", Icons.abc, context),
                    buildRadioListTile(ThemeMode.dark, "Dark Theme",
                        Icons.wb_sunny_outlined, context),
                    buildRadioListTile(ThemeMode.light, "Light Theme",
                        Icons.night_shelter_outlined, context),
                  ],
                ),
              ),

            /*SwitchListTile(
                title: const Text("Dark mode"),
                subtitle: const Text("Switch to Dark mode"),
                value: d_l_mode,
                onChanged: (b) {
                  // make change from light to dark mode should be stateful widget
                  d_l_mode = b;
                }),*/

            /* divider(),
            ListTile(
              trailing: const Icon(Icons.exit_to_app),
              title: const Text("Log Out "),
              onTap: () {
                
                      Provider.of<myprovider>(context, listen: false)
                          .stopTimer();
                   
                // Provider.of<myprovider>(context, listen: false).stopTimer();
                FirebaseAuth.instance.signOut();
              },
            ),*/
            divider(),
            ListTile(
              trailing: const Icon(
                Icons.label_important,
                color: Color.fromARGB(255, 148, 71, 155),
              ),
              title: const Text("How to Use it"),
              onTap: () {
                Navigator.of(context).pushNamed(onboarding.routeName);
              },
            ),
            divider(),
            ListTile(
              trailing: const Icon(
                Icons.developer_board,
                color: Color.fromARGB(255, 148, 71, 155),
              ),
              title: const Text("Dvelopers "),
              onTap: () {
                Navigator.of(context).pushNamed(doing_screen.routeName);
                // Navigator.of(context).pushNamed(splash_Screen.routeName);
                /* Navigator.of(context)
                    .pushNamed(re_enter_screen.routeName)
                    .whenComplete(() {
                  final user = FirebaseAuth.instance.currentUser;
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .update({
                    'bmi': Provider.of<myprovider>(context, listen: false).BMI,
                    'bmr': Provider.of<myprovider>(context, listen: false).BMR,
                  });
                });*/
                // must store bmi and bmr variable in provider and use it
              },
            ),
          ],
        ),
      );
    }

    //  });

    /*
    return Drawer(
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.amber[300],
                child: !isaccont ? const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ) : const Text("data"),
              ),
              if(isaccont)
              const Positioned(
                bottom: -20,
                left: 120,
                child: CircleAvatar(
                  radius: 25,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          // you can put this in function to avoid repaid

          ListTile(
            leading: const Icon(Icons.account_balance),
            // depend on varaiable that determined if their is account show
            /*
            if(){
              trailing:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(register.routeName);
                }, icon: const Icon(Icons.arrow)),
            }
            */
            title: const Text("Regist Now "),
            onTap: () {
              Navigator.of(context).pushNamed(auth_Screen.routeName);
            },
          ),
          divider(),
          SwitchListTile(
              title: const Text("Dark mode"),
              subtitle: const Text("Switch to Dark mode"),
              value: d_l_mode,
              onChanged: (b) {
                // make change from light to dark mode should be stateful widget
                d_l_mode = b;
              }),
          divider(),
          const SizedBox(
            height: 320,
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text("Log Out "),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          divider(),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text("Dvelopers "),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(re_enter_screen.routeName)
                  .whenComplete(() {
                final user = FirebaseAuth.instance.currentUser;
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .update({
                  'bmi': Provider.of<myprovider>(context, listen: false).BMI,
                  'bmr': Provider.of<myprovider>(context, listen: false).BMR,
                });
              });
              // must store bmi and bmr variable in provider and use it
            },
          ),
        ],
      ),
    );*/
  }

  Widget buildRadioListTile(
      ThemeMode themeval, String txt, IconData icon, BuildContext ctx) {
    return RadioListTile(
      secondary: Icon(
        icon,
      ),
      value: themeval,
      groupValue: Provider.of<themeprovider>(ctx, listen: true).tm,
      title: Text(txt),
      onChanged: (newThemeVal) {
        Provider.of<themeprovider>(ctx, listen: false)
            .themeModeChange(newThemeVal);
      },
    );
  }
}
