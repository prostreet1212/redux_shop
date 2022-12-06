import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';
import 'package:redux_shop/ui/badge_list_widget.dart';

import '../model/app_state.dart';
import '../model/coffee_menu.dart';

class BadgeConnector extends StatelessWidget {
  const BadgeConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store);
      },
      builder: (context, vm) {
        return BadgeListWidget(
          badgeList: vm.badgeList,
          clearBadge: vm.onClearBadge,
          changeBuyStatus: vm.onChangeBuyStatus,
        );
      },
    );
  }
}

class _ViewModel {
  final List<CoffeeMenu> badgeList;
  final Function() onClearBadge;
  final Function() onChangeBuyStatus;

  _ViewModel(
      {required this.badgeList,
      required this.onClearBadge,
      required this.onChangeBuyStatus});

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        badgeList: store.state.badgeList,
        onClearBadge: () => store.dispatch(ClearBadgeAction()),
        onChangeBuyStatus: () => store.dispatch(ChangeBuyStatus()),
      );
}
