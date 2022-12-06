import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/model/coffee_menu.dart';
import 'package:redux_shop/ui/badge_widget.dart';
import '../model/app_state.dart';

class BadgeWidgetContainer extends StatelessWidget {
   const BadgeWidgetContainer({Key? key, required this.coffee}) : super(key: key);
  final CoffeeMenu coffee;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store, coffee);
      },
      builder: (context, vm) {
        return BadgeWidget(badgeList: vm.badgeList);
      },
    );
  }
}

class _ViewModel {
  final List<CoffeeMenu> badgeList;

  _ViewModel({
    required this.badgeList,
  });

  static _ViewModel fromStore(Store<AppState> store, CoffeeMenu coffee) {
    return _ViewModel(
      badgeList: store.state.badgeList,
    );
  }
}
