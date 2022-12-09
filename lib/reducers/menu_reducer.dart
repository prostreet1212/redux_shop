import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../model/coffee_menu.dart';

final menuReducer = combineReducers<List<CoffeeMenu>>([
  TypedReducer<List<CoffeeMenu>, BuyNotAction>(_buyNot),
  TypedReducer<List<CoffeeMenu>, MenuLoadedAction>(_setLoadedMenu),
  TypedReducer<List<CoffeeMenu>, ChangeBuyStatus>(_setChangeBuyStatus),
]);

List<CoffeeMenu> _buyNot(List<CoffeeMenu> menuList, BuyNotAction action) {
  menuList = menuList.map((e) {
    if (e == action.coffee) {
      action.coffee = action.coffee.copyWith(isBuy: !action.coffee.isBuy);
      return action.coffee;
    } else {
      return e;
    }
  }).toList();
  //

  return menuList;
  //return menu.copyWith(isBuy: !menu.isBuy);
}

List<CoffeeMenu> _setLoadedMenu(
    List<CoffeeMenu> menuList, MenuLoadedAction action) {
  return action.menuList;
}

List<CoffeeMenu> _setChangeBuyStatus(
    List<CoffeeMenu> menuList, ChangeBuyStatus action) {
  menuList = menuList.map((e) {
    if (e.isBuy == true) {
      e = e.copyWith(isBuy: false);
      return e;
    } else {
      return e;
    }
  }).toList();
  return menuList;
}
