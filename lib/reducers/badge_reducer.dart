

import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';

import '../model/coffee_menu.dart';

final badgeReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, ChangeBadgeCountAction>(_changeBadgeCount),
      TypedReducer<List<CoffeeMenu>, BadgeLoadedAction>(_setLoadedBadge),
    ]);

List<CoffeeMenu> _changeBadgeCount(List<CoffeeMenu> badgeList, ChangeBadgeCountAction action) {

 if(action.coffee.isBuy){
   badgeList=[...badgeList,action.coffee];
 }else{
   badgeList=[...badgeList]..remove(action.coffee);
 }
 return badgeList;
}



List<CoffeeMenu> _setLoadedBadge(List<CoffeeMenu> speakers, BadgeLoadedAction action) {
  return action.badgeList;
}
