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
    gameName: 'Game 1',
    userName: 'Diego',
    topic: 'Topic 1',
    scoreboard: {
      'Tommaso': [45, 200],
      'Diego': [1000, 3000],
      'Sara': [2500, 1000],
    },
    questions: {
      1: Question(
        question:
            'Hai un budget limitato e vuoi investire in un settore emergente. Opzione 1: criptovalute. Opzione 2: energia rinnovabile. Opzione 3: biotecnologie. Quali investimenti sceglieresti e perché?',
        answer:
            "Sceglierei L\'energia rinnovabile perchè è un settore in crescita con prospettive di lungo termine promettenti. Penso che investire in aziende che operano in questo settore potrebbe offrire stabilità e potenziale crescita a lungo termine.",
        summary:
            'La scelta dell\'energia rinnovabile come settore di investimento dipende da vari fattori, inclusi i tuoi obiettivi finanziari, il tuo livello di rischio e la tua prospettiva a lungo termine. Tuttavia, l\'energia rinnovabile è generalmente considerata un settore con prospettive di crescita promettenti per diverse ragioni: Tendenze di mercato: C\'è una crescente domanda di energia pulita e sostenibile, spinta dalle preoccupazioni ambientali e dalle politiche a livello globale volte a ridurre le emissioni di carbonio. Questo crea opportunità di crescita nel settore dell\'energia rinnovabile. Innovazione tecnologica: Le continue innovazioni nel campo delle tecnologie rinnovabili stanno rendendo queste fonti energetiche sempre più competitive rispetto alle fonti tradizionali di energia. Ciò contribuisce a sostenere la crescita nel settore. Sostenibilità a lungo termine: Poiché le risorse rinnovabili come il sole e il vento sono virtualmente illimitate e non emettono gas serra durante la produzione di energia, l\'energia rinnovabile offre un modello di business sostenibile a lungo termine. Tuttavia, è importante notare che nessun investimento è privo di rischi. L\'energia rinnovabile può essere influenzata da fattori come cambiamenti normativi, fluttuazioni dei prezzi delle materie prime e concorrenza nel settore. Prima di prendere una decisione di investimento, è consigliabile condurre una ricerca approfondita e consultare un consulente finanziario per valutare se l\'energia rinnovabile sia adatta al tuo profilo di rischio e ai tuoi obiettivi finanziari.',
        gain: 10,
        updates: {
          'Tommaso': -20.5,
          'Diego': 45.5,
          'Sara': 100,
        },
      ),
      2: Question(
        question: 'Hai investito in un\'azienda tecnologica coinvolta in una controversia legale sulle presunte violazioni del diritto d\'autore, causando una temporanea caduta del prezzo delle azioni. Cosa vorresti fare?',
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
  GameData(
    gameId: '2',
    gameName: 'Game 2',
    userName: 'Diego',
    topic: 'Topic 2',
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
    gameName: 'Game 3',
    userName: 'Sara',
    topic: 'Topic 3',
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
