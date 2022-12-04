import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../model/coffee_menu.dart';

class BadgeWidget extends StatelessWidget {
   BadgeWidget({
    Key? key,required this.badgeList,
  }) : super(key: key);
 List<CoffeeMenu> badgeList;


  @override
  Widget build(BuildContext context) {

    return  Badge(
            badgeContent: Text(badgeList.length.toString()),
            position: const BadgePosition(start: 26, bottom: 26),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
               /* Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BadgeScreen();
                }));*/
              },
            ),
          );

  }
}