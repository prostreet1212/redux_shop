import '../model/app_state.dart';
import 'badge_reducer.dart';
import 'menu_reducer.dart';

AppState appReducer(AppState state, action) {
  return state.copyWith(
      menuList: menuReducer(state.menuList, action),
      badgeList: badgeReducer(state.badgeList,action));
}