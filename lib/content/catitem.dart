import 'package:flutter/material.dart';
import './catmeal1.dart';
import './DD.dart';

class Cat_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;
  final bool ya;
  Cat_item(
    this.id,
    this.title,
    this.color,
    this.image,
    this.ya,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      cat_meal1.routeName,
      arguments: {'id': id, 'title': title, 'ya': ya},
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      
      // onTap: () => selectCategory(context),
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(0),
      child: Card(
       // color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin:const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(image,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style:const TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
