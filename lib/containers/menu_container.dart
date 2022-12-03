import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/ui/menu_widget.dart';
import '../actions/actions.dart';
import '../model/app_state.dart';
import '../model/coffee_menu.dart';


class MenuConnector extends StatelessWidget {
  const MenuConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return MenuWidget(menuList: vm.menuList);
      },
    );
  }
}

class _ViewModel {
  final List<CoffeeMenu> menuList;
  //final Function(CoffeeMenu) onBuyNot;

  _ViewModel({required this.menuList});

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
      menuList: store.state.menuList,
      /*onBuyNot: (coffee) {
        store.dispatch(
          BuyNotAction(store.state.menuList[0]),
        );
      }*/
  ); //copyWith
}