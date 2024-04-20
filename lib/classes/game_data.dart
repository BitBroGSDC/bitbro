import 'question.dart';

class GameData {
  GameData(
      {required this.gameName,
      required this.userName,
      required this.scoreboard,
      required this.questions,
      required this.gameId});
  final String gameId;
  final String gameName;
  final String userName;

  final Map<String, List<int>> scoreboard;

  final Map<int, Question> questions;
}

List<GameData> games = [
  GameData(gameId: '1', gameName: 'Game 1', userName: 'Diego', scoreboard: {
    'Sara': [0, 0, 0, 0, 0],
    'Diego': [0, 0, 0, 0, 0],
    'Davide': [0, 0, 0, 0, 0],
    'Tommaso': [0, 0, 0, 0, 0],
    'Daniele': [0, 0, 0, 0, 0],
  }, questions: {
    1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        updates: {
          'Sara': 0,
          'Diego': 0,
          'Davide': 0,
          'Tommaso': 0,
          'Daniele': 0
        },
        gain: -45,
        summary: "Summary 1"),
    2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        updates: {
          'Sara': 0,
          'Diego': 0,
          'Davide': 0,
          'Tommaso': 0,
          'Daniele': 0
        },
        summary: "Summary 2"),
    3: Question(question: 'Question 3', answer: 'Answer 3', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    4: Question(question: 'Question 4', answer: 'Answer 4', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    5: Question(question: 'Question 5', answer: 'Answer 5', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
  }),
  GameData(gameId: '2', gameName: 'Game 2', userName: 'Diego', scoreboard: {
    'Sara': [0, 0, 0, 0, 0],
    'Diego': [0, 0, 0, 0, 0],
    'Davide': [0, 0, 0, 0, 0],
    'Tommaso': [0, 0, 0, 0, 0],
    'Daniele': [0, 0, 0, 0, 0],
  }, questions: {
    1: Question(question: 'Question 1', answer: 'Answer 1', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    2: Question(question: 'Question 2', answer: 'Answer 2', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    3: Question(question: 'Question 3', answer: 'Answer 3', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    4: Question(question: 'Question 4', answer: 'Answer 4', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
    5: Question(question: 'Question 5', answer: 'Answer 5', updates: {
      'Sara': 0,
      'Diego': 0,
      'Davide': 0,
      'Tommaso': 0,
      'Daniele': 0
    }),
  })
];
