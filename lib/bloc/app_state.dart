part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.currDay = 1,
    this.currentGameIndex = 0,
    this.currDayData,
    this.currGame,
  });

  final int currDay;
  final int currentGameIndex;
  final DayData? currDayData;
  final GameData? currGame;

  @override
  List<Object?> get props => [currDay, currentGameIndex, currDayData, currGame];

  AppState copyWith({
    int? currDay,
    int? currentGameIndex,
    DayData? currDayData,
    GameData? currGame,
  }) {
    return AppState(
      currDay: currDay ?? this.currDay,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      currDayData: currDayData ?? this.currDayData,
      currGame: currGame ?? this.currGame,
    );
  }
}
