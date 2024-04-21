import 'question.dart';

class GameData {
  GameData({required this.gameName, required this.topic, required this.userName, required this.scoreboard, required this.questions, required this.gameId});
  final String gameId;
  final String gameName;
  final String userName;
  final String topic;

  final Map<String, List<double>> scoreboard;

  final Map<int, Question> questions;
}

List<GameData> active_games = [
  GameData(
    gameId: '1',
    gameName: 'Game 1',
    userName: 'User 1',
    topic: 'Topic 1',
    scoreboard: {
      'User 1': [0, 0],
      'User 2': [0, 0],
      'User 3': [0, 0],
    },
    questions: {
      1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        gain: 10,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
        summary: "Summary"
      ),
      2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        gain: 20,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
      ),
      3: Question(
        question: 'Question 3',
        answer: 'Answer 3',
        gain: 30,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
      ),
    },
  ),
  GameData(
    gameId: '2',
    gameName: 'Game 2',
    userName: 'User 2',
    topic: 'Topic 2',
    scoreboard: {
      'User 1': [0, 0],
      'User 2': [0, 0],
      'User 3': [0, 0],
    },
    questions: {
      1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        gain: 10,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
      ),
      2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        gain: 20,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
      ),
      3: Question(
        question: 'Question 3',
        answer: 'Answer 3',
        gain: 30,
        updates: {
          'User 1': 0,
          'User 2': 0,
          'User 3': 0,
        },
      ),
    },
  ),
];

List<GameData> past_games = [
  GameData(
    gameId: '3',
    gameName: 'Game 3',
    userName: 'User 3',
    topic: 'Topic 3',
    scoreboard: {
      'User 1': [1, 2, 3, 4, 5, 6, 7],
      'User 2': [1, 2, 3, 4, 5, 6, 7],
      'User 3': [1, 2, 3, 4, 5, 6, 7],
    },
    questions: {
      1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        gain: 10,
        updates: {
          'User 1': 1,
          'User 2': 1,
          'User 3': 1,
        },
      ),
      2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        gain: 20,
        updates: {
          'User 1': 2,
          'User 2': 2,
          'User 3': 2,
        },
      ),
      3: Question(
        question: 'Question 3',
        answer: 'Answer 3',
        gain: 30,
        updates: {
          'User 1': 3,
          'User 2': 3,
          'User 3': 3,
        },
      ),
      4: Question(
        question: 'Question 4',
        answer: 'Answer 4',
        gain: 40,
        updates: {
          'User 1': 4,
          'User 2': 4,
          'User 3': 4,
        },
      ),
      5: Question(
        question: 'Question 5',
        answer: 'Answer 5',
        gain: 50,
        updates: {
          'User 1': 5,
          'User 2': 5,
          'User 3': 5,
        },
      ),
      6: Question(
        question: 'Question 6',
        answer: 'Answer 6',
        gain: 60,
        updates: {
          'User 1': 6,
          'User 2': 6,
          'User 3': 6,
        },
      ),
      7: Question(
        question: 'Question 7',
        answer: 'Answer 7',
        gain: 70,
        updates: {
          'User 1': 7,
          'User 2': 7,
          'User 3': 7,
        },
      ),
    },
  )
];
