import 'package:bitbro/classes/question.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../classes/game_data.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInit>(_appInit);
  }

  _appInit(AppInit event, Emitter<AppState> emit) {
    int currDay = 1;
    int currentGameIndex = 0;

    GameData? currGame = games[currentGameIndex];

    emit(state.copyWith(
      currDay: currDay,
      currentGameIndex: currentGameIndex,
      currGame: currGame,
    ));
  }
}
