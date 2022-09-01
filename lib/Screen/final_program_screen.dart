import 'package:flutter/material.dart';
import '../Widget/move_sport.dart';
import '../program_data.dart';

class final_program_screen extends StatefulWidget {
  static const routeName = 'final_program_screen';

  const final_program_screen({Key? key}) : super(key: key);

  @override
  State<final_program_screen> createState() => _final_program_screenState();
}

class _final_program_screenState extends State<final_program_screen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final sport_id = routeArg['id'];
    final sport_title = routeArg['title'];
    final cat_sport = DUMMY_MEALS.where((sport) {
      return sport.categories.contains(sport_id);
    }).toList();
    return Scaffold(
   //   backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(cat_sport[0].title),
        backgroundColor:const Color.fromARGB(255, 218, 164, 223),
        elevation: 0,
      ),
      body:/* ListView.builder(
        itemBuilder: (ctx, index) {
          return move_sport(
            id: cat_sport[index].id,
            imgUrl: cat_sport[index].imageUrl,
            complexity: cat_sport[index].complexity,
            title: cat_sport[index].title,
            affordability: cat_sport[index].affordability,
            duration: cat_sport[index].duration,
            togo: 2,
          );
        },
        itemCount: cat_sport.length,
      ),*/
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(cat_sport[0].imageUrl, width: double.infinity,fit: BoxFit.fill,),
           /*   Image.network(
                cat_sport[0].imageUrl,
                fit: BoxFit.cover,
              ),*/
            ),
            selectionBuild("Content"),
            buildCont( ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(cat_sport[0].ingredients[index]),
                  ),
                ),
                itemCount: cat_sport[0].ingredients.length,
              )),
            selectionBuild("Benefit"),
            buildCont( ListView.builder(
                itemBuilder: (ctx, index) => 
                Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index+1}"),
                      ),
                      title: Text(cat_sport[0].steps[index]),
                    ),
                    const Divider(),
                  ],
                ) ,
                itemCount: cat_sport[0].steps.length,
              ),)
          ],
        ),
      ),
    );
  }
  
  Widget selectionBuild( String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  Text(text),
    );
  }

  Widget buildCont(Widget child){
    return  Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.white70,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            height: 200,
            width: 300,
            child:child);
  }

}
