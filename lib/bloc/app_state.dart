part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.selectedQuestion,
    this.currDay = 1,
    this.currentGameIndex = 0,
    this.currGame,
  });

  final int currDay;
  final int currentGameIndex;
  final Question? selectedQuestion;
  final GameData? currGame;

  @override
  List<Object?> get props =>
      [currDay, currentGameIndex, currGame, selectedQuestion];

  AppState copyWith({
    int? currDay,
    int? currentGameIndex,
    GameData? currGame,
    Question? selectedQuestion,
  }) {
    return AppState(
      currDay: currDay ?? this.currDay,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      currGame: currGame ?? this.currGame,
      selectedQuestion: currGame?.questions[currDay],
    );
  }
}
