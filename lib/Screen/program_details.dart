import 'package:flutter/material.dart';
import '../Widget/main_Drawer.dart';
import '../program_data.dart';

class program_details extends StatelessWidget {
  static const routeName = 'program_details';

  Widget selectionBuild( String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  Text(text),
    );
  }

  Widget buildCont(Widget child){
    return  Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            height: 200,
            width: 300,
            child:child);
  }

  const program_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moveId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMove = DUMMY_MEALS.firstWhere((move) => move.id == moveId);
    return Scaffold(
      drawer:const main_drawer(isaccont: false),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 164, 223),
        title: Text(selectedMove.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
              selectedMove.imageUrl,
             
                fit: BoxFit.cover,
              ),
            ),
            selectionBuild("Intgradients"),
            buildCont( ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMove.ingredients[index]),
                  ),
                ),
                itemCount: selectedMove.ingredients.length,
              )),
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
