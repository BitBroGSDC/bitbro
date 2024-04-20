import 'DayData.dart';
import 'question.dart';
import 'summaryDay.dart';

class GameData {
  GameData(
      {required this.gameName,
      required this.userName,
      required this.scoreboard,
      required this.daysData,
      required this.gameId});
  final String gameId;
  final String gameName;
  final String userName;

  final Map<String, List<int>> scoreboard;

  final Map<int, DayData> daysData;
}

List<GameData> games = [
  GameData(gameId: '1', gameName: 'Game 1', userName: 'Sara', scoreboard: {
    'Sara': [1, 2, 3, 4, 5, 6, 7],
    'Diego': [1, 2, 3, 4, 5, 6, 7],
    'Tommaso': [1, 2, 3, 4, 5, 6, 7],
    'Davide': [1, 2, 3, 4, 5, 6, 7]
  }, daysData: {
    1: DayData(
        summary: SummaryDay(
            text:
                'Today we have to do a lot of things, let\'s start with the first one',
            updates: {
              'Sara': 4,
              'Diego': 10,
              'Tommaso': 2,
              'Davide': 5
            }),
        question: Question(
            question: 'What is the capital of Italy?',
            answer: 'Rome',
            submitted: false,
            opinion: 'I think it is Rome',
            result: 1)),
    2: DayData(
        summary: SummaryDay(
            text:
                'Today we have to do a lot of things, let\'s start with the first one',
            updates: {
              'Sara': 4,
              'Diego': 10,
              'Tommaso': 2,
              'Davide': 5
            }),
        question: Question(
            question: 'What is the capital of Italy?',
            answer: 'Rome',
            submitted: false,
            opinion: 'I think it is Rome',
            result: 1)),
    3: DayData(
        summary: SummaryDay(
            text:
                'Today we have to do a lot of things, let\'s start with the first one',
            updates: {
              'Sara': 4,
              'Diego': 10,
              'Tommaso': 2,
              'Davide': 5
            }),
        question: Question(
            question: 'What is the capital of Italy?',
            answer: 'Rome',
            submitted: false,
            opinion: 'I think it is Rome',
            result: 1)),
    4: DayData(
        summary: SummaryDay(
            text:
                'Today we have to do a lot of things, let\'s start with the first one',
            updates: {
              'Sara': 4,
              'Diego': 10,
              'Tommaso': 2,
              'Davide': 5
            }),
        question: Question(
            question: 'What is the capital of Italy?',
            answer: 'Rome',
            submitted: false,
            opinion: 'I think it is Rome',
            result: 1)),
  }),
];
