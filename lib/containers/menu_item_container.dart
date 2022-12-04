import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/ui/menu_item_widget.dart';
import '../actions/actions.dart';

import '../model/app_state.dart';
import '../model/coffee_menu.dart';

class MenuItemContainer extends StatelessWidget {
  MenuItemContainer({Key? key, required this.coffee}) : super(key: key);
  CoffeeMenu coffee;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store, coffee);
      },
      builder: (context, vm) {
        return MenuItemWidget(coffee: vm.coffee, buyNot: vm.onBuyNot);
      },
    );
  }
}

class _ViewModel {
  final CoffeeMenu coffee;
  final Function(CoffeeMenu) onBuyNot;

  _ViewModel({required this.coffee, required this.onBuyNot});

  static _ViewModel fromStore(Store<AppState> store, CoffeeMenu coffee) {
    final coffeeMenu =
        store.state.menuList.firstWhere((element) => element == coffee);
    return _ViewModel(
        coffee: coffeeMenu,
        onBuyNot: (coffee) {
          store.dispatch(
            BuyNotAction(coffeeMenu.copyWith(
                image: coffee.image,
                name: coffee.name,
                price: coffee.price,
                isBuy: coffee.isBuy)),
          );
        });
    ;
  } //copyWith
}
