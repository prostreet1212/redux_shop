import 'package:flutter/material.dart';
import 'package:redux_shop/containers/menu_container.dart';

import '../model/coffee_menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key})
      : super(key: key);



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux shop'),
        centerTitle: true,
      ),
      body: MenuConnector(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
