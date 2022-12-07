import '../model/coffee_menu.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
   List<CoffeeMenu> menuList;
  final List<CoffeeMenu> badgeList;


   AppState(
      {this.menuList = const [],
      this.badgeList = const [],});

  factory AppState.initial() =>  AppState();

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
