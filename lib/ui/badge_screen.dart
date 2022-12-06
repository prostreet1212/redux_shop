import 'package:flutter/material.dart';

import '../containers/badge_list_container.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key? key, required this.onInit}) : super(key: key);
  final void Function() onInit;

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  @override
  void initState() {
    widget.onInit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BadgeConnector(),
    );
  }
}
