import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:x2/Screen/account_screen.dart';
import 'package:x2/Screen/account_screen2.dart';
import 'package:x2/Screen/splash_screen.dart';
import 'package:x2/Widget/main_drawer.dart';
import 'package:x2/main.dart';

import 'main_Screen.dart';


class tab_screen extends StatefulWidget {
  const tab_screen({ Key? key }) : super(key: key);

  @override
  State<tab_screen> createState() => _tab_screenState();
}

class _tab_screenState extends State<tab_screen> {

final List<Map<String, dynamic>> _Pages =[
  {
    'page': account_Screen(),
    'title': "basic"
  },
  {
    'page': account_screen2(),
    'title' : "meals"
  },
  {
    'page': main_Screen(n: 2,),
    'title': "Another"
  }
];

int _selectedPageIndex =0 ;
void selectPage(int value){
  setState(() {
    _selectedPageIndex = value;
  });
}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const splash_Screen();
            }
            if(snapshot.hasData){
              return 
    
    
    Scaffold(
      drawer: main_drawer(isaccont: true),
      appBar: AppBar(title: Text(_Pages[_selectedPageIndex]['title']),
       backgroundColor: const Color(0xFFD902EE),
          elevation: 0,
      ),
      body: _Pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.black12,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.black87,
        currentIndex: _selectedPageIndex,
        items:const [
           BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: "Basic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart_outlined),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert_outlined),
            label: "Another",
          )
        ],
      ),
    );
            }
            else{
              return MyHomePage();
            }
          });

    
    
    Scaffold(
      drawer: main_drawer(isaccont: true),
      appBar: AppBar(title: Text(_Pages[_selectedPageIndex]['title']),),
      body: _Pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.red[500],
        unselectedItemColor: Colors.blue[500],
        currentIndex: _selectedPageIndex,
        items:const [
           BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: "basic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart_outlined),
            label: "meals",
          )
        ],
      ),
    );
  }
}