part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.selectedQuestion,
    this.currDay = 1,
    this.currentGameIndex = 0,
    this.currGame,
    this.questionOfLastDay,
  });

  final int currDay;
  final int currentGameIndex;
  final Question? selectedQuestion;
  final Question? questionOfLastDay;
  final GameData? currGame;

  @override
  List<Object?> get props => [
        currDay,
        currentGameIndex,
        currGame,
        selectedQuestion,
        questionOfLastDay
      ];

  AppState copyWith({
    int? currDay,
    int? currentGameIndex,
    GameData? currGame,
    Question? selectedQuestion,
    Nullable<Question>? questionOfLastDay,
  }) {
    return AppState(
      currDay: currDay ?? this.currDay,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      currGame: currGame ?? this.currGame,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      questionOfLastDay: questionOfLastDay == null
          ? this.questionOfLastDay
          : questionOfLastDay.value,
    );
  }
}
