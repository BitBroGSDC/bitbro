import 'package:bitbro/classes/courses/topic.dart';
import 'package:bitbro/classes/game_data.dart';

import 'custom_paragraph.dart';

class Course {
  Course({
    this.completion = 20,
    required this.title,
    required this.description,
    required this.topics,
    this.activeGames = const [],
    this.pastGames = const [],
  });

  final String title;

  final String description;
  final List<Topic> topics;
  final List<GameData> activeGames;
  final List<GameData> pastGames;
  final int completion;

  Course copyWith({
    int? completion,
    String? title,
    String? description,
    List<Topic>? topics,
    List<GameData>? activeGames,
    List<GameData>? pastGames,
  }) {
    return Course(
      completion: completion ?? this.completion,
      title: title ?? this.title,
      description: description ?? this.description,
      topics: topics ?? this.topics,
      activeGames: activeGames ?? this.activeGames,
      pastGames: pastGames ?? this.pastGames,
    );
  }

  double get completedTopicsPercentage {
    int completedTopics = 0;
    for (var topic in topics) {
      if (topic.isCompleted) {
        completedTopics++;
      }
    }
    return (completedTopics / topics.length);
  }
}

List<Course> courses = [
  Course(
    completion: 60,
    pastGames: past_games,
    activeGames: active_games,
    title: 'Introduzione agli Investimenti',
    description:
        'Questo corso fornisce una panoramica introduttiva sugli investimenti finanziari, coprendo tipologie di investimento, rischi, strategie di allocazione e analisi di mercato. È ideale per chi desidera acquisire una comprensione di base degli investimenti per iniziare a pianificare in modo consapevole il proprio futuro finanziario.',
    topics: [
      Topic(
          isCompleted: true,
          title: 'Principi fondamentali degli investimenti',
          description:
              'Questo capitolo offre una panoramica essenziale sui concetti di base degli investimenti finanziari, inclusi rischio e rendimento, diversificazione e obiettivi finanziari.',
          paragraphs: [
            CustomParagraph(
                text:
                    "Valutazione di Rischio e Rendimento:\nIn questo capitolo esamineremo il principio fondamentale della valutazione di rischio e rendimento negli investimenti. Il rischio e il rendimento sono interconnessi e comprendere come valutare e gestire entrambi è essenziale per gli investitori. Mentre il rendimento potenziale può essere allettante, è importante valutare attentamente il livello di rischio associato a un investimento. Questo ci permette di bilanciare le nostre aspettative di guadagno con la nostra tolleranza al rischio, assicurando una gestione prudente del nostro portafoglio."),
            CustomParagraph(
                text:
                    "Importanza della Diversificazione:\nIl principio della diversificazione è fondamentale per la gestione di un portafoglio di investimento solido e resistente. In questo capitolo esploreremo come la diversificazione può aiutarci a mitigare il rischio complessivo del nostro portafoglio, distribuendo il capitale tra diverse categorie di attività. Questo ci permette di ridurre l'impatto negativo di eventi specifici su un singolo investimento e aumenta la nostra resilienza complessiva alle fluttuazioni del mercato. Comprendere e applicare correttamente la diversificazione ci aiuta a costruire portafogli più stabili nel lungo termine, in grado di sopportare le sfide e capitalizzare sulle opportunità di investimento."),
          ],
          level: 'easy'),
      Topic(
          title: 'Tipi di investimenti e rischi associati',
          description:
              'Questo capitolo fornisce una panoramica esaustiva dei vari tipi di investimenti disponibili sul mercato finanziario e dei rischi specifici associati a ciascuna categoria di investimento.',
          paragraphs: [
            CustomParagraph(
                text:
                    "Esplorazione dei Tipi di Investimenti:\nIn questo capitolo, esamineremo i diversi tipi di investimenti disponibili e i rischi associati ad essi. Esistono molte opzioni di investimento, ognuna con caratteristiche uniche e potenziali rendimenti e rischi. Comprendere queste opzioni è fondamentale per scegliere gli investimenti più adatti alle nostre esigenze e obiettivi finanziari. Esploreremo investimenti tradizionali come azioni e obbligazioni, così come opzioni più innovative come le criptovalute e gli investimenti immobiliari."),
            CustomParagraph(
                text:
                    "Analisi dei Rischi Associati:\nOgni tipo di investimento porta con sé rischi specifici che devono essere compresi e gestiti attentamente dagli investitori. In questo capitolo, esamineremo i rischi associati a diversi tipi di investimenti e come valutarli in modo accurato. I rischi possono includere la volatilità del mercato, l'instabilità economica, il rischio di credito e molti altri fattori. Capire questi rischi e implementare strategie per mitigarli è essenziale per proteggere e far crescere il nostro patrimonio nel lungo termine."),
          ],
          level: 'medium'),
    ],
  ),
  Course(
    activeGames: active_games,
    completion: 40,
    title: 'Come gestire il debito',
    description:
        'Questo corso fornisce una guida pratica su come gestire il debito in modo efficace, aiutando gli individui a comprendere i vari tipi di debito, sviluppare strategie per ridurlo e pianificare una gestione finanziaria sana per il futuro.',
    topics: [
      Topic(
          title: 'Analisi dei Tipi di Debito',
          description:
              'Questo capitolo esplora i diversi tipi di debito che gli individui possono affrontare, dalla comprensione dei prestiti studenteschi alle implicazioni delle carte di credito, passando per i finanziamenti auto e le complessità delle ipoteche.',
          paragraphs: [
            CustomParagraph(
                text:
                    "Analisi dei Tipi di Debito: Prestiti Studenteschi, Carte di Credito e Finanziamenti Auto:\nEsplorare i diversi tipi di debito è come navigare attraverso un labirinto finanziario, ognuno con i suoi percorsi intricati e implicazioni uniche. I prestiti studenteschi rappresentano spesso il primo assaggio di debito per molti giovani, con termini e condizioni che possono essere un mistero per i neofiti finanziari. Passando poi alle carte di credito, ci imbattiamo in un mondo di convenienza e pericolo, dove la linea sottile tra l'uso responsabile e l'accumulo incontrollato di debito può portare a conseguenze finanziarie durature. E mentre i finanziamenti auto possono offrire la libertà di movimento, anche qui si nascondono insidie finanziarie, con interessi e condizioni che possono far lievitare i costi oltre le aspettative. In questo viaggio attraverso i tipi di debito, si aprono gli occhi sulle sfide e le opportunità finanziarie che ogni categoria porta con sé, preparando gli individui a navigare in modo più sicuro e consapevole nel mondo del credito."),
            CustomParagraph(
                text:
                    "Analisi dei Tipi di Debito: Le Implicazioni Finanziarie delle Ipoteche:\nLe ipoteche rappresentano uno dei punti salienti nel viaggio finanziario di molti individui, simboleggiando spesso un traguardo di stabilità e successo. Tuttavia, dietro questa soglia si nascondono intricati dettagli finanziari che richiedono una comprensione attenta. Dalla scelta tra tassi fissi e variabili alle implicazioni finanziarie di un acconto più alto o più basso, le decisioni relative alle ipoteche possono avere un impatto significativo sulle finanze a lungo termine. Capire le diverse opzioni di finanziamento immobiliare e navigare attraverso il processo di acquisto di una casa richiede una pianificazione diligente e una consapevolezza delle implicazioni finanziarie. Questo capitolo guida gli individui attraverso le complessità delle ipoteche, fornendo una mappa per navigare con successo le acque turbolente del mercato "),
          ],
          level: 'easy'),
      Topic(
          title: 'Strategie per la Gestione del Debito Personale',
          description:
              'Questo capitolo fornisce una guida dettagliata su strategie pratiche per gestire il debito personale in modo responsabile, includendo la negoziazione con i creditori e il consolidamento del debito.',
          paragraphs: [
            CustomParagraph(
                text:
                    "Strategie per la Gestione del Debito Personale: Pianificazione e Negoziazione:\nLa gestione del debito personale richiede una combinazione di pianificazione strategica e capacità di negoziazione. Innanzitutto, è essenziale creare un piano di pagamento strutturato che tenga conto del reddito disponibile e delle spese mensili. Questo piano serve da guida per gestire il debito in modo efficace e garantire che i pagamenti siano effettuati in modo puntuale. Inoltre, la negoziazione con i creditori può essere un'abilità preziosa per ridurre il peso del debito. La capacità di comunicare in modo chiaro e assertivo con i creditori può portare a piani di rimborso più favorevoli, come tassi di interesse ridotti o periodi di grazia estesi. Imparare a negoziare in modo efficace può fare la differenza nella gestione del debito e nel raggiungimento degli obiettivi finanziari a lungo termine."),
            CustomParagraph(
                text:
                    "Strategie per la Gestione del Debito Personale: Consolidamento e Educazione Finanziaria:\nUn'altra strategia chiave per la gestione del debito personale è il consolidamento del debito. Questa tecnica consente di combinare più debiti in un'unica fonte di finanziamento, semplificando i pagamenti e potenzialmente riducendo i tassi di interesse complessivi. Tuttavia, è importante valutare attentamente i costi e i benefici del consolidamento del debito prima di procedere, poiché potrebbe non essere la soluzione migliore per tutti i debitori. Inoltre, l'educazione finanziaria svolge un ruolo fondamentale nella gestione del debito personale. Comprendere i concetti di base della finanza personale, come budgeting, risparmio e investimento, può aiutare a prevenire il sovraindebitamento e fornire gli strumenti necessari per navigare con successo nel mondo finanziario. Investire tempo ed energie nell'educazione finanziaria può avere un impatto duraturo sulla salute finanziaria complessiva e sulla capacità di gestire efficacemente il debito nel lungo termine."),
          ],
          level: 'medium'),
    ],
  ),
  Course(
    activeGames: active_games,
    title: 'Trading di Criptovalute',
    description:
        'Questo corso fornisce una introduzione pratica al trading di criptovalute, coprendo principi fondamentali, analisi di mercato e gestione dei rischi. È ideale per chi vuole iniziare a negoziare criptovalute con sicurezza.',
    topics: [
      Topic(
          title: 'provola',
          description: 'provola',
          paragraphs: [
            CustomParagraph(text: "provola"),
            CustomParagraph(text: "provola"),
          ],
          level: 'medium'),
    ],
  ),
  Course(
    activeGames: active_games,
    title: "Fondamenti dell'Investimento Azionario",
    description:
        'Questo corso offre una panoramica completa degli investimenti in azioni, coprendo concetti fondamentali, strategie di selezione e analisi di titoli.',
    topics: [
      Topic(
          title: 'provola',
          description: 'provola',
          paragraphs: [
            CustomParagraph(text: "provola"),
            CustomParagraph(text: "provola"),
          ],
          level: 'easy'),
    ],
  ),
  Course(
    activeGames: active_games,
    title: 'Analisi Tecnica per il Mercato Azionario',
    description:
        "Un corso avanzato che approfondisce l'analisi tecnica nel trading azionario, esaminando indicatori di mercato, pattern di prezzo e strategie di trading basate su dati storici.",
    topics: [
      Topic(
          title: 'provola',
          description: 'provola',
          paragraphs: [
            CustomParagraph(text: "provola"),
            CustomParagraph(text: "provola"),
          ],
          level: 'hard'),
    ],
  )
];
