import 'DayData.dart';
import 'question.dart';
import 'summaryDay.dart';

class GameData {
  GameData(
      {required this.gameName,
      required this.userName,
      required this.scoreboard,
      required this.currDay,
      required this.daysData,
      required this.gameId});
  final String gameId;
  final String gameName;
  final String userName;
  final Map<String, int> scoreboard;

  //number from 1 to 7
  final int currDay;

  final Map<int, DayData> daysData;
}

List<GameData> games = [
  GameData(
      gameId: '1',
      gameName: 'Game 1',
      userName: 'Sara',
      scoreboard: {'Sara': 4, 'Diego': 10, 'Tommaso': 2, 'Davide': 5},
      currDay: 1,
      daysData: {
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
