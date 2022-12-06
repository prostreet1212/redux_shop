import '../model/coffee_menu.dart';

class BuyNotAction {
  CoffeeMenu coffee;
  BuyNotAction(this.coffee);
}

class ChangeBadgeCountAction{
  CoffeeMenu coffee;
  ChangeBadgeCountAction(this.coffee);
}

class LoadMenuAction {}

class MenuLoadedAction {
  final List<CoffeeMenu> menuList;
  MenuLoadedAction(this.menuList);
}

class LoadBadgeAction {}

class BadgeLoadedAction {
  final List<CoffeeMenu> badgeList;
  BadgeLoadedAction(this.badgeList);
}


class ChangeBuyStatus{}
class ClearBadgeAction {}
