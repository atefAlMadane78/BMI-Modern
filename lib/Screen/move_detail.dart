import 'package:flutter/material.dart';
import '../1.2%20dummy_data.dart';
import '../Widget/main_Drawer.dart';

class move_detail extends StatelessWidget {
  static const routeName = 'move_detail';

  Widget selectionBuild( String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  Text(text),
    );
  }

  Widget buildCont(Widget child){
    return  Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              border: Border.all(
                color: Colors.white38,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            height: 300,
            width: 300,
            child:child);
  }

  const move_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moveId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMove = DUMMY_MEALS.firstWhere((move) => move.id == moveId);
    return Scaffold(
    //  backgroundColor: Colors.white,
      drawer:const main_drawer(isaccont: false),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 114, 221),
        title: Text(selectedMove.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child:Image.asset(selectedMove.imageUrl,height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,),
              /* Image.network(
                selectedMove.imageUrl,
                fit: BoxFit.cover,
              ),*/
            ),
            //selectionBuild("Intgradients"),
          /*  buildCont( ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMove.ingredients[index]),
                  ),
                ),
                itemCount: selectedMove.ingredients.length,
              )),*/
            selectionBuild("Steps"),
            buildCont( ListView.builder(
                itemBuilder: (ctx, index) => 
                Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index+1}"),
                      ),
                      title: Text(selectedMove.steps[index]),
                    ),
                    const Divider(),
                  ],
                ) ,
                itemCount: selectedMove.steps.length,
              ),)
          ],
        ),
      ),
    );
  }
}
