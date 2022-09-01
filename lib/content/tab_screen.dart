import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduals/mealProvider.dart';
import './models/meal.dart';
import 'Cat1.dart';
import 'DD.dart';
import 'catitem.dart';
import 'favoritescreen.dart';
import 'meal_item.dart';

class tab_screen1 extends StatefulWidget {
  static const routeName = 'tab';
  final List<Meal> _favoriteMeals;
  const tab_screen1(this._favoriteMeals);

  @override
  _tab_screen1State createState() => _tab_screen1State();
}

class _tab_screen1State extends State<tab_screen1> {
  late List<Map<String, Object>> _pages;
  int selectPageIndex = 0;
  var searchController = TextEditingController();
  var s;
  //var searched;
  var b = false;
  var empty = true;
  @override
  void initState() {
    Provider.of<mealProvider>(context, listen: false).getdata();
    _pages = [
      {
        'page': Cat1(),
        'title': 'categories',
      },
      {
        'page': FavoriteScreen(widget._favoriteMeals),
        'title': 'favorites',
      },
    ];
    super.initState();
  }

  void selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "${_pages[selectPageIndex]['title']}",
        ),
        backgroundColor:const Color.fromARGB(255, 194, 86, 204),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // if you want do search in favorities uncomment here and comment there ....
            /* TextField(
              controller: searchController,
              key: const ValueKey("search"),
              decoration: const InputDecoration(label: Text("search")),
              onChanged: (val) {
                setState(() {
                  //print(val);
                  b = true;
                  if(val.isNotEmpty) empty= false;
                  if(val.isEmpty) {
                    s = null;
                    empty= true;
                  }
                  s = DUMMY_MEALS.where((element) {
                    return element.title.contains(val);
                  }).toList();
                  //print(s);

                 /* searched = s.map((cat) {
                    return cat.title;
                  });*/
                });
              },
              
            ),
            IconButton(
                onPressed: () {
                 /* var searched = s.map((cat) {
                    return cat.title;
                  });*/
                  /*  print(s.map((cat){
                    return cat.title;
                  }));*/
                 // print(searched);
                  //print(s);
                  setState(() {
                    b= !b;
                     //  not done as should be
                  });
                },
                icon: const Icon(Icons.ac_unit)),
            if (b)
             
              Container(
                child:(empty==true || s.length == 0)?const Text("not founded  "):  ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Meal_item(
                      id: s[index].id,
                      imageUrl: s[index].imageUrl,
                      title: s[index].title,
                      calories: s[index].calories,
                      ingredients: s[index].ingredients,
                    );
                  },
                  itemCount: s.length,
                ),
                
                color: Colors.white,
                height: 250,
              ),

           */

            _pages[selectPageIndex]['page'] as Widget,
          ],
        ),
      ),

      /*Column(
        children: [
          TextField(
        controller: searchController,
        key: ValueKey("search"),
        decoration: InputDecoration(label: Text("searchh")),
        onChanged: (val) {
          print(val);
          b = true;
          s = DUMMY_MEALS.where((element) {
            return element.title.contains(val);
          });
          print(s);
        },
      ),
      IconButton(
          onPressed: () {
            print(s);
          },
          icon: Icon(Icons.ac_unit)),
      if (b) Text("data"),

      _pages[selectPageIndex]['page'] as Widget,
        ],
      ),
       */
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        elevation: 6,
        backgroundColor: Colors.black12,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorites',
          ),
        ],
      ),
      // drawer: MainDrawer(),
    );
  }
}
