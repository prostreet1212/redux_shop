import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../model/app_state.dart';
import '../model/coffee_menu.dart';

final buyNotReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, BuyNotAction>(_buyNot)]);

List<CoffeeMenu> _buyNot(List<CoffeeMenu> menuList, BuyNotAction action) {
  menuList = menuList.map((e) {
    if (e == action.coffee) {
      menuList.add(CoffeeMenu(action.coffee.image, action.coffee.name, action.coffee.price,));
      return action.coffee;
    } else {
      return e;
    }
  }).toList();
  return menuList;
}

AppState appReducer(AppState state, action) {
  return state.copyWith(menuList: buyNotReducer(state.menuList, action));
}