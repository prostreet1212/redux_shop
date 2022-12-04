

import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';

import '../model/coffee_menu.dart';

final badgeReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, ChangeBadgeCountAction>(_changeBadgeCount)]);

List<CoffeeMenu> _changeBadgeCount(List<CoffeeMenu> badgeList, ChangeBadgeCountAction action) {

 if(!action.coffee.isBuy){
   badgeList.add(action.coffee);
 }else{
   badgeList.remove(action.coffee);
 }
 return badgeList;
}
