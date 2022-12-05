import '../model/coffee_menu.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<CoffeeMenu> menuList;
  final List<CoffeeMenu> badgeList;


  const AppState(
      {this.menuList = const [/*
        CoffeeMenu(image: 'latte.jpg', name: 'Латте', price: 80, isBuy: false),
        CoffeeMenu(
            image: 'latte_grusha.jpg',
            name: 'Латте груша',
            price: 100,
            isBuy: false),
        CoffeeMenu(
            image: 'malina_kokos.jpg',
            name: 'Раф малина-кокос',
            price: 100,
            isBuy: false),
        CoffeeMenu(image: 'raf.jpg', name: 'Раф', price: 100, isBuy: false),
     */ ],
      this.badgeList = const [],});

  factory AppState.initial() => const AppState();

  AppState copyWith({List<CoffeeMenu>? menuList, List<CoffeeMenu>? badgeList}) {
    return AppState(
        menuList: menuList ?? this.menuList,
        badgeList: badgeList ?? this.badgeList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          menuList == other.menuList &&
          badgeList == other.badgeList;

  @override
  int get hashCode => menuList.hashCode^badgeList.hashCode;

  @override
  String toString() {
    return 'AppState{menuList: $menuList, badgeList: $badgeList}';
  }


}
