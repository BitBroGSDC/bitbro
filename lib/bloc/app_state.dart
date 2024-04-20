part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.selectedQuestion,
    this.currDay = 1,
    this.currentGameIndex = 0,
    this.currGame,
    this.questionOfLastDay,
    this.activeCourses = const [],
    this.currentCourseIndex = 0,
    this.currentCourse,
  });

  final int currDay;
  final int currentGameIndex;
  final int currentCourseIndex;
  final Question? selectedQuestion;
  final Question? questionOfLastDay;
  final GameData? currGame;
  final List<Course> activeCourses;
  final Course? currentCourse;

  @override
  List<Object?> get props => [
        currDay,
        currentGameIndex,
        currGame,
        selectedQuestion,
        questionOfLastDay,
        activeCourses,
        currentCourseIndex,
        currentCourse
      ];

  AppState copyWith({
    int? currDay,
    int? currentGameIndex,
    GameData? currGame,
    Question? selectedQuestion,
    Nullable<Question>? questionOfLastDay,
    List<Course>? activeCourses,
    int? currentCourseIndex,
    Course? currentCourse,
  }) {
    return AppState(
      currDay: currDay ?? this.currDay,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      currGame: currGame ?? this.currGame,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      questionOfLastDay: questionOfLastDay == null
          ? this.questionOfLastDay
          : questionOfLastDay.value,
      activeCourses: activeCourses ?? this.activeCourses,
      currentCourseIndex: currentCourseIndex ?? this.currentCourseIndex,
      currentCourse: currentCourse ?? this.currentCourse,
    );
  }
}
