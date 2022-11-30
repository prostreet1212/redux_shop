
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../model/coffee_menu.dart';
import 'package:flutter/material.dart';

import '../ui/menu_screen.dart';

class BuyNotAction {
  CoffeeMenu coffee;
  BuyNotAction(this.coffee);
}

@immutable
class AppState {
  final List<CoffeeMenu> menuList;

  const AppState({this.menuList = const [ CoffeeMenu('latte.jpg', 'Латте', 80),
    CoffeeMenu('latte_grusha.jpg', 'Латте груша', 100),
    CoffeeMenu('malina_kokos.jpg', 'Раф малина-кокос', 100),
    CoffeeMenu('raf.jpg', 'Раф', 100),]});

  factory AppState.initial() => const AppState();

  AppState copyWith({List<CoffeeMenu>? menuList}) {
    return AppState(menuList: menuList ?? this.menuList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          menuList == other.menuList;

  @override
  int get hashCode => menuList.hashCode;

  @override
  String toString() {
    return 'AppState{menuList: $menuList}';
  }
}

final buyNotReducer = combineReducers<List<CoffeeMenu>>(
    [TypedReducer<List<CoffeeMenu>, BuyNotAction>(_buyNot)]);

List<CoffeeMenu> _buyNot(List<CoffeeMenu> menuList, BuyNotAction action) {
  menuList = [...menuList, CoffeeMenu('image2', 'name2', 4)];
  return menuList;
}

AppState appReducer(AppState state, action) {
  return state.copyWith(menuList: buyNotReducer(state.menuList, action));
}

class MenuConnector extends StatelessWidget {
  const MenuConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return MenuScreen(menuList: vm.menuList, buyNot: vm.onBuyNot);
      },
    );
  }
}

class _ViewModel {
  final List<CoffeeMenu> menuList;
  final Function(CoffeeMenu) onBuyNot;

  _ViewModel({required this.menuList, required this.onBuyNot});

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
      menuList: store.state.menuList,
      onBuyNot: (coffee) => store.dispatch(BuyNotAction(store.state.menuList)));//copyWith
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final store=Store<AppState>(
      appReducer,
      initialState: AppState.initial()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(store: store, child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuConnector(),
    ));
  }
}

