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
      return e.copyWith(
          image: action.coffee.image,
          name: action.coffee.name,
          price: action.coffee.price,
          isBuy: !action.coffee.isBuy);
    } else {
      return e;
    }
  }).toList();
  return menuList;
}

List<CoffeeMenu> _setLoadedMenu(
    List<CoffeeMenu> speakers, MenuLoadedAction action) {
  return action.menuList;
}

List<CoffeeMenu> _setChangeBuyStatus(
    List<CoffeeMenu> menuList, ChangeBuyStatus action) {
  menuList = menuList.map((e) {
    if (e.isBuy) {
      return e.copyWith(
          image: e.image, name: e.name, price: e.price, isBuy: false);
    } else {
      return e;
    }
  }).toList();
  return menuList;
}
