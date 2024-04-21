import 'question.dart';

class GameData {
  GameData(
      {required this.gameName,
      required this.topic,
      required this.userName,
      required this.scoreboard,
      required this.questions,
      required this.gameId});
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
    gameName: "Investment Match",
    userName: 'Diego',
    topic: "Fundamentals of Investments",
    scoreboard: {
      'Tommaso': [45, 200],
      'Diego': [1000, 3000],
      'Sara': [2500, 1000],
    },
    questions: {
      1: Question(
        question:
            "You have a limited budget and want to invest in an emerging sector. Option 1: cryptocurrencies. Option 2: renewable energy. Option 3: biotechnology. Which investments would you choose and why?",
        answer:
            "I would choose renewable energy because it is a growing sector with promising long-term prospects. I believe investing in companies operating in this sector could offer stability and long-term growth potential.",
        summary:
            "The choice of renewable energy as an investment sector depends on various factors, including your financial goals, risk tolerance, and long-term perspective. However, renewable energy is generally considered a sector with promising growth prospects for several reasons:\nMarket Trends: There is a growing demand for clean and sustainable energy, driven by environmental concerns and global policies aimed at reducing carbon emissions. This creates growth opportunities in the renewable energy sector.\nTechnological Innovation: Continuous innovations in renewable technologies are making these energy sources increasingly competitive compared to traditional sources of energy. This contributes to supporting growth in the sector.\nLong-term Sustainability: Since renewable resources like the sun and wind are virtually limitless and do not emit greenhouse gases during energy production, renewable energy offers a sustainable long-term business model.\nHowever, it is important to note that no investment is without risks. Renewable energy can be influenced by factors such as regulatory changes, fluctuations in commodity prices, and competition in the industry. Before making an investment decision, it is advisable to conduct thorough research and consult a financial advisor to assess whether renewable energy is suitable for your risk profile and financial goals.",
        gain: 2000,
        updates: {
          'Tommaso': 155,
          'Diego': 45.5,
          'Sara': -1500,
        },
      ),
      2: Question(
        question:
            "You have invested in a technology company involved in a legal controversy over alleged copyright violations, causing a temporary drop in the stock price. What would you like to do?",
        answer: 'Answer 2',
      ),
    },
  ),
  GameData(
    gameId: '2',
    gameName: "Risk Game",
    userName: 'Diego',
    topic: "Types of Investments and Associated Risks",
    scoreboard: {
      'Tommaso': [0, 0],
      'Diego': [0, 0],
      'Sara': [0, 0],
    },
    questions: {
      1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        gain: 10,
        updates: {
          'Tommaso': 0,
          'Diego': 0,
          'Sara': 0,
        },
      ),
      2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        gain: 20,
        updates: {
          'Tommaso': 0,
          'Diego': 0,
          'Sara': 0,
        },
      ),
      3: Question(
        question: 'Question 3',
        answer: 'Answer 3',
        gain: 30,
        updates: {
          'Tommaso': 0,
          'Diego': 0,
          'Sara': 0,
        },
      ),
    },
  ),
];

List<GameData> past_games = [
  GameData(
    gameId: '3',
    gameName: "Investment Strategy Match",
    userName: 'Sara',
    topic: "Advanced Investment Concepts",
    scoreboard: {
      'Tommaso': [1, 2, 3, 4, 5, 6, 7],
      'Diego': [1, 2, 3, 4, 5, 6, 7],
      'Sara': [1, 2, 3, 4, 5, 6, 7],
    },
    questions: {
      1: Question(
        question: 'Question 1',
        answer: 'Answer 1',
        gain: 10,
        updates: {
          'Tommaso': 1,
          'Diego': 1,
          'Sara': 1,
        },
      ),
      2: Question(
        question: 'Question 2',
        answer: 'Answer 2',
        gain: 20,
        updates: {
          'Tommaso': 2,
          'Diego': 2,
          'Sara': 2,
        },
      ),
      3: Question(
        question: 'Question 3',
        answer: 'Answer 3',
        gain: 30,
        updates: {
          'Tommaso': 3,
          'Diego': 3,
          'Sara': 3,
        },
      ),
      4: Question(
        question: 'Question 4',
        answer: 'Answer 4',
        gain: 40,
        updates: {
          'Tommaso': 4,
          'Diego': 4,
          'Sara': 4,
        },
      ),
      5: Question(
        question: 'Question 5',
        answer: 'Answer 5',
        gain: 50,
        updates: {
          'Tommaso': 5,
          'Diego': 5,
          'Sara': 5,
        },
      ),
      6: Question(
        question: 'Question 6',
        answer: 'Answer 6',
        gain: 60,
        updates: {
          'Tommaso': 6,
          'Diego': 6,
          'Sara': 6,
        },
      ),
      7: Question(
        question: 'Question 7',
        answer: 'Answer 7',
        gain: 70,
        updates: {
          'Tommaso': 7,
          'Diego': 7,
          'Sara': 7,
        },
      ),
    },
  )
];
