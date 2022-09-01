import 'package:flutter/material.dart';
import 'package:x2/Widget/move_sport.dart';
import '../1.2 dummy_data.dart';

class final_Sport_screen extends StatefulWidget {
  static const routeName = 'final_sport_screen';

  const final_Sport_screen({Key? key, id}) : super(key: key);

  @override
  State<final_Sport_screen> createState() => _final_Sport_screenState();
}

class _final_Sport_screenState extends State<final_Sport_screen> {
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
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(sport_title!),
        backgroundColor:const Color.fromARGB(255, 212, 114, 221),
          elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return move_sport(
            id: cat_sport[index].id,
            imgUrl: cat_sport[index].imageUrl,
            complexity: cat_sport[index].complexity,
            title: cat_sport[index].title,
            affordability: cat_sport[index].affordability,
            duration: cat_sport[index].duration,
           n: 1,
          );
        },
        itemCount: cat_sport.length,
      ),
    );
  }
}
