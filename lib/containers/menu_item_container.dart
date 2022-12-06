import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/ui/menu_item_widget.dart';
import '../actions/actions.dart';

import '../model/app_state.dart';
import '../model/coffee_menu.dart';

class MenuItemContainer extends StatelessWidget {
  const MenuItemContainer({Key? key, required this.coffee}) : super(key: key);
  final CoffeeMenu coffee;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store, coffee);
      },
      builder: (context, vm) {
        return MenuItemWidget(
          coffee: vm.coffee,
          buyNot: vm.onBuyNot,
          changeBadgeCount: vm.onChangeBadgeCount,
        );
      },
    );
  }
}

class _ViewModel {
  final CoffeeMenu coffee;
  final Function(CoffeeMenu) onBuyNot;
  final Function(CoffeeMenu) onChangeBadgeCount;

  _ViewModel(
      {required this.coffee,
      required this.onBuyNot,
      required this.onChangeBadgeCount});

  static _ViewModel fromStore(Store<AppState> store, CoffeeMenu coffee) {
    final coffeeMenu =
        store.state.menuList.firstWhere((element) => element == coffee);
    return _ViewModel(
        coffee: coffeeMenu,
        onBuyNot: (coffeeMenu) {
          store.dispatch(
            BuyNotAction(
              coffeeMenu,
            ),
          );
        },
        onChangeBadgeCount: (coffeeMenu) {
          store.dispatch(ChangeBadgeCountAction(coffeeMenu));
        });
  } //copyWith
}
