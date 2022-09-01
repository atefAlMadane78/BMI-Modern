import 'package:flutter/material.dart';
import './models/category.dart';
import './catitem.dart';
import './DD.dart';
import 'meal_item.dart';

class Cat1 extends StatefulWidget {
  @override
  State<Cat1> createState() => _Cat1State();
}

class _Cat1State extends State<Cat1> {
   var searchController = TextEditingController();

  var s;

  //var searched;
  var b = false;

  var empty= true;

  @override
  Widget build(BuildContext context) {
    return Card(
     // color: Colors.white,
      margin:const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              //style: TextStyle(color: Colors.white),
              controller: searchController,
              key: const ValueKey("search"),
              decoration: const InputDecoration(label: Text("search", style: TextStyle(color: Color.fromARGB(255, 148, 71, 155),))),
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
              color:const Color.fromARGB(255, 148, 71, 155),
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
                child:(empty==true || s.length == 0)?const Text("Not Founded  "):  ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Meal_item(
                      id: s[index].id,
                      imageUrl: s[index].imageUrl,
                      title: s[index].title,
                      calories: s[index].calories,
                      ingredients: s[index].ingredients,
                      where: 1,
                    );
                  },
                  itemCount: s.length,
                ),
                
                //color: Colors.white,
                height: 250,
              ),

            Column(
             // shrinkWrap: true,
              children: DUMMY_CATEGORIES
                  .map(
                    (catDate) => Cat_item(catDate.id, catDate.title, catDate.color,
                        catDate.image, catDate.ya),
                  )
                  .toList(),
              /*gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,*/
            ),
          ],
        ),
      ),
    );
  }
}