import 'package:flutter/material.dart';
import 'package:x2/Screen/final_program_screen.dart';
import 'package:x2/Screen/final_sport_screen.dart';

class sport_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final int togo;

  sport_item(
      {required this.id,
      required this.title,
      required this.color,
      required this.togo});

  void selectitem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(final_Sport_screen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  void selectitem2(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(final_program_screen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (togo == 1) {
          selectitem(context);
        } else {
          selectitem2(context);
        }
      },
      //() => selectitem(context),
      borderRadius: BorderRadius.circular(20.0),
      splashColor: Colors.blue[500],
      child: Container(
        
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text(title)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
