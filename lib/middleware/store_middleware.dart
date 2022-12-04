import 'package:redux/redux.dart';
import 'package:redux_shop/repository/menu_repository.dart';

import '../model/app_state.dart';
/*
List<Middleware<AppState>> createStoreMiddleware(
    [MenuRepository speakersRepo = const ConstMenuRepository(),
      ]) {
  final saveSpeakers = _createSaveSpeakers(speakersRepo);
  final loadSpeakers = _createLoadSpeakers(speakersRepo);


  return [
    TypedMiddleware<AppState, LoadSpeakersAction>(loadSpeakers),
    TypedMiddleware<AppState, UpdateSpeakerAction>(saveSpeakers),
    TypedMiddleware<AppState, UpdateSpeakerAction>(saveTalks),
  ];
}*/