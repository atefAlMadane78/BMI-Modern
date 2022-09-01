import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x2/Screen/account_screen.dart';
import 'package:x2/Screen/auth_Screen.dart';
import 'package:x2/Screen/change_screen.dart';
import 'package:x2/Screen/onboarding.dart';
import 'package:x2/Screen/program_details.dart';
import 'package:x2/Screen/re2.dart';
import 'package:x2/Screen/splash_screen.dart';
import 'package:x2/Screen/tab_screen.dart';
import 'package:x2/content/cat2.dart';
import 'package:x2/content/catmeal1.dart';
import 'package:x2/content/meal_details.dart';
import 'package:x2/content/tab_screen.dart';
import 'package:x2/moduals/mealProvider.dart';
//import 'package:x2/Widget/main_drawer.dart';
import 'package:x2/moduals/myprovider.dart';
import 'package:x2/moduals/screenProvider.dart';
import 'package:x2/moduals/themeprovider.dart';
import './Screen/doing_screen.dart';
import './Screen/final_program_screen.dart';
import '../Screen/regist.dart';
import '../Screen/final_sport_screen.dart';
import '../Screen/move_detail.dart';
import '../Screen/program.dart';
import '../Screen/sport_screen.dart';
import '../Screen/bmi_Screen.dart';
import '../Screen/main_Screen.dart';
import '../Screen/result_screen.dart';
import 'Screen/re_enter_screen.dart';
import 'Widget/main_Drawer.dart';
import 'contant.dart';
import 'package:http/http.dart' as http;
import 'content/DD.dart';
import 'content/filters_screen.dart';
import 'content/models/meal.dart';
import 'moduals/logo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
   String u ="https://bmi-modern-default-rtdb.firebaseio.com" ;
  http.post(Uri.parse(u), body:json.encode({
    'id' : 10,
    'name ':"mmmm"
  }) );*/

/*          Right code 
  var url = "https://bmi-modern-default-rtdb.firebaseio.com/product.json";
  http.post(Uri.parse(url),
      body: json.encode({
        "id": 5,
        "name": "mohsen",
      }));
  print(Uri.parse(url));

*/

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<myprovider>(
        create: (_) => myprovider(),
      ),
      ChangeNotifierProvider<themeprovider>(
        create: (_) => themeprovider(),
      ),
      ChangeNotifierProvider<screenProvider>(
        create: (_) => screenProvider(),
      ),
      ChangeNotifierProvider<mealProvider>(
        create: (_) => mealProvider(),
      ),
    ],
    child: MyApp(),
  )

      /*ChangeNotifierProvider(
      create: (_) => myprovider(),
      child: MyApp() ,
    )*/

      );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
/*@override
  void didChangeDependencies() {
    Provider.of<themeprovider>(context, listen:false ).getThemeMode();
    super.didChangeDependencies();
  }*/
  @override
  void initState() {
  super.initState();
  Provider.of<themeprovider>(context, listen:false ).getThemeMode();
  }
 List<Meal> _favoriteMeals = [];
  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((Meal) => Meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((Meal) => Meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((Meal) => Meal.id == id);
  }
  
  @override
  Widget build(BuildContext context) {
    
    //Provider.of<themeprovider>(context, listen:true ).getThemeMode();
    var tm = Provider.of<themeprovider>(context, listen:true ).tm;
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PRo 5",
      themeMode: tm,
      theme: ThemeData(
        dialogBackgroundColor: Colors.white70,
        appBarTheme:const AppBarTheme(color:   Color.fromARGB(255, 194, 86, 204)),
        primaryColor:const Color(0xFF32ccbc),
        accentColor:const Color.fromARGB(255, 191, 250, 244),
        canvasColor: Colors.white ,// Color(0xFF90f7ec), //const Color.fromRGBO(255, 254, 229, 1),
        buttonColor: const Color(0xFFce9ffc),
        cardColor:Colors.white,//const Color(0xFF32ccbc),
        shadowColor: Colors.white60,
        //iconTheme:IconThemeData(color: Color.fromARGB(255, 148, 71, 155)) ,
        textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
              color: Color.fromARGB(255, 47, 78, 94),
            )),
        // scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        dialogBackgroundColor: Colors.black54,
        primaryColor: primaryColor,
        accentColor: accentColor,
        canvasColor:Colors.black,//const Color.fromARGB(255, 250, 171, 250),
        buttonColor: Colors.white70,
        cardColor: const Color.fromRGBO(5, 34, 39, 1),
        shadowColor: Colors.white60,
        unselectedWidgetColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: const TextStyle(
              color: Colors.white60,
            )),
        // scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.pink,
      ),
      home: //FutureBuilder(
          //future: Firebase.initializeApp(),
          // builder: (ctx, fsnapshot) {
          StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const splash_Screen();
          }
          if (snapshot.hasData) {
            print(snapshot.hasData);
            return const tab_screen();
          } else {
            print(snapshot.hasData);
            return const MyHomePage();
          }
        },
      ),
      // }),
      routes: {
        //'/': (context) => const MyHomePage(),
        bmi_Screen.routeName: (context) => const bmi_Screen(),
        result_screen.routeName: (context) => result_screen(),
        sport_screen.routeName: (context) => sport_screen(),
        final_Sport_screen.routeName: (context) => final_Sport_screen(),
        move_detail.routeName: (context) => move_detail(),
        program.routeName: (context) => program(),
        register.routeName: (context) => register(),
        re_enter_screen.routeName: (context) => re_enter_screen(false),
        doing_screen.routeName: (context) => doing_screen(),
        final_program_screen.routeName: (context) => final_program_screen(),
        auth_Screen.routeName: (context) => auth_Screen(),
        account_Screen.routeName: (context) => account_Screen(),
        change_screen.routeName: (context) => change_screen(),
        onboarding.routeName: (context) => onboarding(),
        splash_Screen.routeName: (context) => splash_Screen(),
        program_details.routeName : (context) => program_details(),
        tab_screen1.routeName :(context) => tab_screen1(/*_favoriteMeals*/ Provider.of<mealProvider>(context, listen: true).favoriteMeals),
        FilterScreen.routeName: (context) => FilterScreen(),
        cat_meal1.routeName:(context) => cat_meal1(_toggleFavorites, _isMealFavorite),
        MealDetails.routeName:(context) => MealDetails(_toggleFavorites, _isMealFavorite),
        FilterScreen.routeName:(context) => FilterScreen(),
        re2.routeName:(context) => re2(),
        //Provider.of<mealProvider>(context, listen: false).toggleFavorite()
        //tab_screen.routeName : (context) => tab_screen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // Provider.of<themeprovider>(context, listen: false).getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      /*
      decoration: const BoxDecoration(
          gradient:grad_color),*/
      child: Scaffold(
        drawer: const main_drawer(isaccont: false),
      //  backgroundColor: Colors.black,
        appBar: AppBar(
          //title: const Text("BMI Modern "),
          backgroundColor:const Color(0xFFD902EE),
          elevation: 0,
        ),
        body: Column(
          children: [
            // Image.asset("images/Ellipse 21.png"),
            Stack(children: [
              Image.asset(
                "images/logo.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ]),

            /* CustomPaint(
          painter: logo(),
          child: Container(height: 300.0,
          child: Image.asset("images/TLogo.png",fit: BoxFit.contain,),
          //color: Colors.black54,
          ),
        ),*/

            /* Transform(
              transform: Matrix4.rotationX(35 * (3.14 / 180)),
              child: Container(
                height: 200.0,
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(2500, 900),
                          bottomLeft: Radius.elliptical(950, 500)),
                    ),
                    child: const Center(
                      child: Text("LoGo"),
                    )),
              ),
            ),*/
            main_Screen(n: 1,),
            /* FlatButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('/chat/8yMwYYKEuieugJAJVVQ3/message')
                      .snapshots()
                      .listen((event) {
                    print(event.docs[0]['text']);
                  });
                },
                child: Text("data"))*/
          ],
        ),
        // backgroundColor:Colors.transparent,
      ),
    );
  }
}
