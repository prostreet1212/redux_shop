import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../model/app_state.dart';
import '../model/coffee_menu.dart';

final menuReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, BuyNotAction>(_buyNot)]);

List<CoffeeMenu> _buyNot(List<CoffeeMenu> menuList, BuyNotAction action) {
  return menuList.map((e) {
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
}

AppState appReducer(AppState state, action) {
  return state.copyWith(menuList: menuReducer(state.menuList, action));
}
