import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Badge(
            badgeContent: Text('1'),
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