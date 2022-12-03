import 'package:flutter/material.dart';
import 'package:redux_shop/containers/menu_item_container.dart';

import '../model/coffee_menu.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key, required this.menuList}) : super(key: key);

  final List<CoffeeMenu> menuList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.5),
      padding:
      const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: menuList.map(
            (menu) {
          return MenuItemContainer(coffee: menu,);
        },
      ).toList(),
    );
  }
}
