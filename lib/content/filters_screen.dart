import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../moduals/mealProvider.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = 'filters';
  @override
  Widget build(BuildContext context) {
      //Provider.of<mealProvider>(context, listen: false).getdata();
    return Scaffold(
      appBar: AppBar(title: Text("your fav")),
      body: Center(
        child: Text("filters"),
      ),
     // drawer: MainDrawer(),
    );
  }
}
