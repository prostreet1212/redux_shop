import 'package:flutter/material.dart';
import 'package:redux_shop/containers/badge_widget_container.dart';
import 'package:redux_shop/containers/menu_container.dart';
import 'package:redux_shop/model/coffee_menu.dart';
import 'package:redux_shop/ui/badge_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, required this.onInit}) : super(key: key);
  final void Function() onInit;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux shop'),
        centerTitle: true,
        leading: BadgeWidgetContainer(
          coffee: CoffeeMenu(image: 'aaa', name: 'vvv', price: 3, isBuy: false),
        ),
      ),
      body: MenuConnector(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
