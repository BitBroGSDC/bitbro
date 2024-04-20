import 'dart:async';

import 'package:bitbro/classes/question.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../classes/courses/course.dart';
import '../classes/game_data.dart';
import '../classes/nullable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInit>(_appInit);
    on<ChangeCourse>(_changeCourse);
    on<ChangeGame>(_changeGame);
  }

  _appInit(AppInit event, Emitter<AppState> emit) {
    int currDay = 2;
    int currentCourseIndex = 0;
    int currentGameIndex = 0;

    List<Course> coursesMocked = courses;

    Course currCourse = coursesMocked[currentCourseIndex];

    GameData? currGame = currCourse.activeGames[currentGameIndex];
    Question? selectedQuestion = currGame.questions[currDay];
    Question? questionOfLastDay;

    if (currDay > 1) {
      questionOfLastDay = currGame.questions[currDay - 1];
    } else {
      questionOfLastDay = null;
    }

    emit(state.copyWith(
      activeCourses: coursesMocked,
      currDay: currDay,
      currentGameIndex: currentGameIndex,
      currGame: currGame,
      selectedQuestion: selectedQuestion,
      questionOfLastDay: Nullable(questionOfLastDay),
    ));
  }

  _changeCourse(ChangeCourse event, Emitter<AppState> emit) {
    int currentCourseIndex = event.courseIndex;
    int currentGameIndex = 0;

    List<Course> coursesMocked = courses;

    GameData? currGame =
        coursesMocked[currentCourseIndex].activeGames[currentGameIndex];

    int currDay = currGame.questions.keys.last;
    Question? selectedQuestion = currGame.questions[currDay];

    Question? questionOfLastDay;

    if (currDay > 1) {
      questionOfLastDay = currGame.questions[state.currDay - 1];
    } else {
      questionOfLastDay = null;
    }

    emit(state.copyWith(
      activeCourses: coursesMocked,
      currentCourseIndex: currentCourseIndex,
      currentGameIndex: currentGameIndex,
      currGame: currGame,
      selectedQuestion: selectedQuestion,
      currDay: currDay,
      questionOfLastDay: Nullable(questionOfLastDay),
    ));
  }

  _changeGame(ChangeGame event, Emitter<AppState> emit) {
    int newGameIndex = event.gameIndex;

    GameData? newCourse =
        state.activeCourses[state.currentCourseIndex].activeGames[newGameIndex];

    int currDay = newCourse.questions.keys.last;

    Question? selectedQuestion = newCourse.questions[currDay];

    Question? questionOfLastDay;

    if (currDay > 1) {
      questionOfLastDay = newCourse.questions[currDay - 1];
    } else {
      questionOfLastDay = null;
    }

    emit(state.copyWith(
      currGame: newCourse,
      selectedQuestion: selectedQuestion,
      currDay: currDay,
      questionOfLastDay: Nullable(questionOfLastDay),
      currentGameIndex: newGameIndex,
    ));
  }
}
