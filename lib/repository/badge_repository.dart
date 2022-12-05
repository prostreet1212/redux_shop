import '../model/coffee_menu.dart';

abstract class BadgeRepository {
  const BadgeRepository();

  List<CoffeeMenu> loadBadge();

}

class ConstBadgeRepository extends BadgeRepository {
  const ConstBadgeRepository();

  static const List<CoffeeMenu> badgeMenu = <CoffeeMenu>[];

  @override
  List<CoffeeMenu>  loadBadge() {
    return badgeMenu;
  }


}