

import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';

import '../model/coffee_menu.dart';

final badgeReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, BuyNotAction>(_changeBadgeCount),
      TypedReducer<List<CoffeeMenu>, BadgeLoadedAction>(_setLoadedBadge),
      TypedReducer<List<CoffeeMenu>, ClearBadgeAction>(_setClearBadge),

    ]);

List<CoffeeMenu> _changeBadgeCount(List<CoffeeMenu> badgeList, BuyNotAction action) {

 if(action.coffee.isBuy){
   badgeList=[...badgeList,action.coffee];
 }else{
   badgeList=[...badgeList]..remove(action.coffee.copyWith(isBuy:!action.coffee.isBuy));
 }
 return badgeList;
}



List<CoffeeMenu> _setLoadedBadge(List<CoffeeMenu> speakers, BadgeLoadedAction action) {
  return action.badgeList;
}

List<CoffeeMenu> _setClearBadge(List<CoffeeMenu> badgeList, ClearBadgeAction action) {
  badgeList=[];
  return badgeList;
}
