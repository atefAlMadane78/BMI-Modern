import 'dart:io';
import 'package:provider/provider.dart';
import 'package:x2/Screen/tab_screen.dart';
import '../Screen/re_enter_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x2/Screen/account_screen.dart';
import 'package:x2/Widget/authform.dart';
import '../contant.dart';
import '../moduals/myprovider.dart';

class auth_Screen extends StatefulWidget {
  static const routeName = 'auth_Screen';
  const auth_Screen({Key? key}) : super(key: key);

  @override
  State<auth_Screen> createState() => _auth_ScreenState();
}

class _auth_ScreenState extends State<auth_Screen> {
  final _auth = FirebaseAuth.instance;
  final User? userr = FirebaseAuth.instance.currentUser;
  late SharedPreferences _pref;
  late bool remb;
  bool _isLoading = false;
  bool wg = false;
  

  void _submitAuthForm(String email, String password, String uesrname,
      File image, bool isLogin, BuildContext ctx) async {
       
       /* _pref = await SharedPreferences.getInstance();
        bool where_regist = _pref.getBool('where_regist') ?? false;
        print(where_regist);
        print("11111111111111111111111111111111111");*/

    UserCredential _authresult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        _authresult = await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            /*.whenComplete(() =>
                Provider.of<myprovider>(context, listen: false).startTimer())*/;
        Navigator.of(context).pop(); // close auth screen

        setState(() {
          if (userr != null) {
           // Provider.of<myprovider>(context, listen: false).stopTimer();
          }
         // Provider.of<myprovider>(context, listen: false).startTimer();
        });
        //  Navigator.of(context).pop(); // close drawer
        // Navigator.of(context).pushReplacementNamed(tab_screen.routeName);
        /*.whenComplete((){
               Provider.of<myprovider>(context, listen: false).startTimer();
            })*/
      } 
      else {
        /* 12/8
        SharedPreferences _pref = await SharedPreferences.getInstance();
        bool where_regist = _pref.getBool('where_regist') ?? false;
        // print(where_regist);
        if (where_regist == true) {
          SharedPreferences _pref = await SharedPreferences.getInstance();
          _pref.setBool('where_regist', false);
          // this dialog show depend on parameter dertermin form where user regist
          final alert = AlertDialog(
            title:const Text("title "),
            content: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Text(
                      "Will take the info you entered \n if you want change it press on Re_Enter ..."),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Text("RE_Enter"),
                        onTap: () {
                          wg = true;
                          print("object");
                          Navigator.of(context)
                              .pushNamed(re_enter_screen.routeName);
                        },
                      ),
                      InkWell(
                        child: const Text("Okay"),
                        onTap: () {
                          wg = true;
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
        }
        12/ 8*/

        _authresult = await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .whenComplete(() async {
          // Provider.of<myprovider>(context, listen: false).startTimer();

          _pref = await SharedPreferences.getInstance();
          remb = _pref.getBool('remember_me') ?? false;

          if (remb == true) {
            final user = FirebaseAuth.instance.currentUser;
            _pref.setString("userID", user!.uid);
          }
           Navigator.of(context).pop();
       //     Navigator.of(context).pop();
        });
        Navigator.of(context).pop();
        setState(() {
          if (userr != null) {
          //  Provider.of<myprovider>(context, listen: false).stopTimer();
          }
         // Provider.of<myprovider>(context, listen: false).startTimer();
        }); // close auth screen
        //Navigator.of(context).pop(); // close drawer

        
      /* 
      15/8
      if (wg == false) {
          //Navigator.of(context).pushNamed(re_enter_screen.routeName);
          Scaffold.of(ctx).showSnackBar(SnackBar(
            content: Text("You Should Enter this info...."),
            backgroundColor: Colors.green[300],
          ));
        }*/

        final ref = FirebaseStorage.instance
            .ref()
            .child("user_image")
            .child(_authresult.user!.uid + '.jpg');

        await ref.putFile(image);

        final url = await ref.getDownloadURL();

        final user = FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance
            .collection('users')
            .doc(_authresult.user!.uid)
            .set({
          'email': email,
          'username': uesrname,
          'password': password,
          'userID': user!.uid,
          'image_url': url,
          'bmi': [18.0],
          'bmr': [1600.0],
          'date': [
            1.0,
            10.0,
            20.0,
            28.0,
          ],
        });
      }
    } on FirebaseAuthException catch (e) {
      String msg = "Error Ocured";

      if (e.code == 'weak-password') {
        msg = ("The password provided is too weak ..");
      } else if (e.code == 'email-already-in-use') {
        msg = ('The account is already exists ');
      } else if (e.code == 'user-not-found') {
        msg = ("No user found for the email");
      } else if (e.code == 'wrong-password') {
        msg = ("Wrong password provided for the email");
      }
      print(msg);
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor:const Color.fromARGB(255, 194, 86, 204),
      ));
      print(msg);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
        //  color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                authform(_submitAuthForm, _isLoading),
             /*   const SizedBox(
                  height: 500,
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
