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
}

List<Course> courses = [
  Course(
    completion: 60,
    pastGames: past_games,
    activeGames: active_games,
    title: 'Introduction to Investments',
    description:
        "This course provides an introductory overview of financial investments, covering investment types, risks, allocation strategies, and market analysis. It is ideal for those looking to gain a basic understanding of investments to start planning their financial future consciously.",
    topics: [
      Topic(
          isCompleted: true,
          title: "Fundamentals of Investments",
          description:
              "This chapter provides an essential overview of the basic concepts of financial investments, including risk and return, diversification, and financial goals.",
          paragraphs: [
            CustomParagraph(
                text:
                    "Risk and Return Assessment:\nIn this chapter, we will examine the fundamental principle of risk and return assessment in investments. Risk and return are interconnected, and understanding how to assess and manage both is essential for investors. While potential return may be enticing, it's important to carefully evaluate the level of risk associated with an investment. This allows us to balance our earning expectations with our risk tolerance, ensuring prudent portfolio management."),
            CustomParagraph(
                text:
                    "Importance of Diversification:\nThe principle of diversification is crucial for managing a robust and resilient investment portfolio. In this chapter, we will explore how diversification can help us mitigate the overall risk of our portfolio by spreading capital across different asset classes. This allows us to reduce the negative impact of specific events on a single investment and increases our overall resilience to market fluctuations. Understanding and properly applying diversification helps us build more stable long-term portfolios, capable of weathering challenges and capitalizing on investment opportunities."),
          ],
          level: 'easy'),
      Topic(
          title: "Types of Investments and Associated Risks",
          description:
              "This chapter provides a comprehensive overview of the various types of investments available in the financial market and the specific risks associated with each investment category.",
          paragraphs: [
            CustomParagraph(
                text:
                    "Exploring Types of Investments:\nIn this chapter, we will examine the various types of investments available and the risks associated with them. There are many investment options, each with unique characteristics and potential returns and risks. Understanding these options is crucial for choosing investments that best suit our financial needs and goals. We will explore traditional investments such as stocks and bonds, as well as more innovative options like cryptocurrencies and real estate investments."),
            CustomParagraph(
                text:
                    "Analysis of Associated Risks:\nEvery type of investment carries specific risks that must be understood and carefully managed by investors. In this chapter, we will examine the risks associated with different types of investments and how to accurately assess them. Risks may include market volatility, economic instability, credit risk, and many other factors. Understanding these risks and implementing strategies to mitigate them is essential for protecting and growing our wealth in the long term."),
          ],
          level: 'medium'),
    ],
  ),
  Course(
    activeGames: active_games,
    completion: 40,
    title: "How to Manage Debt",
    description:
        "This course provides a practical guide on effectively managing debt, helping individuals understand the various types of debt, develop strategies to reduce it, and plan for healthy financial management for the future.",
    topics: [
      Topic(
          title: "Analysis of Types of Debt",
          description:
              "This chapter explores the different types of debt individuals may encounter, from understanding student loans to the implications of credit cards, to auto financing, and the complexities of mortgages.",
          paragraphs: [
            CustomParagraph(
                text:
                    "Analysis of Types of Debt: Student Loans, Credit Cards, and Auto Financing:\nExploring the various types of debt is like navigating through a financial maze, each with its intricate pathways and unique implications. Student loans often represent the first taste of debt for many young individuals, with terms and conditions that can be a mystery to financial newcomers. Moving on to credit cards, we encounter a world of convenience and danger, where the thin line between responsible use and unchecked debt accumulation can lead to lasting financial consequences. And while auto financing may offer the freedom of movement, financial pitfalls also lurk here, with interest rates and conditions that can drive costs beyond expectations.\nIn this journey through the types of debt, eyes are opened to the financial challenges and opportunities that each category brings, preparing individuals to navigate the world of credit more safely and consciously."),
            CustomParagraph(
                text:
                    "Analisi dei Tipi di Debito: Le Implicazioni Finanziarie delle Ipoteche:\nLe ipoteche rappresentano uno dei punti salienti nel viaggio finanziario di molti individui, simboleggiando spesso un traguardo di stabilità e successo. Tuttavia, dietro questa soglia si nascondono intricati dettagli finanziari che richiedono una comprensione attenta. Dalla scelta tra tassi fissi e variabili alle implicazioni finanziarie di un acconto più alto o più basso, le decisioni relative alle ipoteche possono avere un impatto significativo sulle finanze a lungo termine. Capire le diverse opzioni di finanziamento immobiliare e navigare attraverso il processo di acquisto di una casa richiede una pianificazione diligente e una consapevolezza delle implicazioni finanziarie. Questo capitolo guida gli individui attraverso le complessità delle ipoteche, fornendo una mappa per navigare con successo le acque turbolente del mercato "),
          ],
          level: 'easy'),
      Topic(
          title: "Strategies for Personal Debt Management",
          description:
              "This chapter provides a detailed guide on practical strategies for responsibly managing personal debt, including negotiating with creditors and debt consolidation.",
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
    title: "Cryptocurrency Trading",
    description:
        "This course provides a practical introduction to cryptocurrency trading, covering fundamental principles, market analysis, and risk management. It is ideal for those who want to start trading cryptocurrencies with confidence.",
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
    title: "Fundamentals of Stock Investment",
    description:
        "This course provides a comprehensive overview of stock investments, covering fundamental concepts, selection strategies, and securities analysis.",
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
    title: "Technical Analysis for the Stock Market",
    description:
        "An advanced course delving into technical analysis in stock trading, examining market indicators, price patterns, and trading strategies based on historical data.",
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
