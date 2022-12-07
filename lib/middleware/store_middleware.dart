import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';
import 'package:redux_shop/repository/badge_repository.dart';
import 'package:redux_shop/repository/menu_repository.dart';

import '../model/app_state.dart';

List<Middleware<AppState>> createStoreMiddleware([
  MenuRepository menuRepo = const ConstMenuRepository(),
  BadgeRepository badgeRepo = const ConstBadgeRepository(),
]) {
  final loadMenu = _createLoadMenu(menuRepo);
  final loadBadge = _createLoadBadge(badgeRepo);

  return [
    TypedMiddleware<AppState, LoadMenuAction>(loadMenu),
    TypedMiddleware<AppState,LoadBadgeAction>(loadBadge),

  ];
}

Middleware<AppState> _createLoadMenu(MenuRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var a = repository.loadMenu();
    store.dispatch(
      MenuLoadedAction(a),
    );
    next(action);
  };
}

Middleware<AppState> _createLoadBadge(BadgeRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var list = repository.loadBadge();
    store.dispatch(
      BadgeLoadedAction(list),
    );
    next(action);
  };
}
/*
Middleware<AppState> _createSaveMenu(MenuRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.saveMenu(
      store.state.menuList,
    );
  };
}*/
