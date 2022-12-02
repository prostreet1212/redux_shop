
import '../model/coffee_menu.dart';
import 'package:flutter/material.dart';





@immutable
class AppState {
  final List<CoffeeMenu> menuList;

  const AppState(
      {this.menuList = const [
        CoffeeMenu('latte.jpg', 'Латте', 80),
        CoffeeMenu('latte_grusha.jpg', 'Латте груша', 100),
        CoffeeMenu('malina_kokos.jpg', 'Раф малина-кокос', 100),
        CoffeeMenu('raf.jpg', 'Раф', 100),
      ]});

  factory AppState.initial() => const AppState();

  AppState copyWith({List<CoffeeMenu>? menuList}) {
    return AppState(menuList: menuList ?? this.menuList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              menuList == other.menuList;

  @override
  int get hashCode => menuList.hashCode;

  @override
  String toString() {
    return 'AppState{menuList: $menuList}';
  }
}