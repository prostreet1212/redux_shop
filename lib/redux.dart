
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'model/coffee_menu.dart';

class BuyNotAction{}

@immutable
class AppState{
  final List<CoffeeMenu> menuList;

   const AppState({ this.menuList =  const[CoffeeMenu('image', 'name', 3)]});

   factory AppState.initial()=>const AppState();

   AppState copyWith({ List<CoffeeMenu>? menuList}){
     return AppState(menuList: menuList??this.menuList);
   }

  @override
  bool operator ==(Object other) =>
      identical(this, other)||
          other is AppState&&runtimeType==other.runtimeType&&menuList==other.menuList;

  @override
  int get hashCode =>menuList.hashCode;

  @override
  String toString() {
    return 'AppState{menuList: $menuList}';
  }
}

final buyNotReducer=combineReducers<List<CoffeeMenu>>([
  TypedReducer<List<CoffeeMenu>,BuyNotAction>(_increment)
]);

List<CoffeeMenu> _increment(List<CoffeeMenu> menuList,BuyNotAction action){
  menuList=[...menuList,CoffeeMenu('image2', 'name2', 4)];
  return menuList;
}