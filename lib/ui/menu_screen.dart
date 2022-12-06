import 'package:flutter/material.dart';
import 'package:redux_shop/containers/badge_widget_container.dart';
import 'package:redux_shop/containers/menu_container.dart';
import 'package:redux_shop/model/coffee_menu.dart';

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
        title: const Text('Redux shop'),
        centerTitle: true,
        leading: const BadgeWidgetContainer(
          coffee:  CoffeeMenu(image: 'aaa', name: 'vvv', price: 3, isBuy: false),
        ),
      ),
      body: const MenuConnector(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
