import '../model/coffee_menu.dart';

abstract class MenuRepository {
  const MenuRepository();

  List<CoffeeMenu> loadMenu();
  void changeMenuStatus(CoffeeMenu coffeeMenu);
  void saveMenu(List<CoffeeMenu> menu);
}

class ConstMenuRepository extends MenuRepository {
  const ConstMenuRepository();

  static const List<CoffeeMenu> listMenu = <CoffeeMenu>[
    CoffeeMenu(image: 'latte.jpg', name: 'Латте',price: 80,isBuy: false),
    CoffeeMenu(image:'latte_grusha.jpg', name:'Латте груша', price: 100,isBuy: false),
    CoffeeMenu(image:'malina_kokos.jpg', name:'Раф малина-кокос', price: 100,isBuy: false),
    CoffeeMenu(image:'raf.jpg', name:'Раф', price: 100,isBuy: false),
  ];

  @override
  List<CoffeeMenu>  loadMenu() {
    return listMenu;
  }

  @override
  void changeMenuStatus(CoffeeMenu coffeeMenu) {
    return;
  }

  @override
  void saveMenu(List<CoffeeMenu> menu) {
    return;
  }
}
