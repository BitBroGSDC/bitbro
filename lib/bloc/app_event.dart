part of 'app_bloc.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInit extends AppEvent {
  const AppInit();
}

class SelectQuestion extends AppEvent {
  final Question questionIndex;

  const SelectQuestion(this.questionIndex);

  @override
  List<Object> get props => [questionIndex];
}

class ChangeCourse extends AppEvent {
  final int courseIndex;

  const ChangeCourse(this.courseIndex);

  @override
  List<Object> get props => [courseIndex];
}

class ChangeGame extends AppEvent {
  final int gameIndex;

  const ChangeGame(this.gameIndex);

  @override
  List<Object> get props => [gameIndex];
}
