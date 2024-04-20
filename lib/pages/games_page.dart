import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// game structure:
// - name
// - arguments
// - level
// -gain
const int TOTAL_LEVELS = 10;

class Game {
  final String name;
  final String arguments;
  final int level;
  final double gain;

  Game({
    required this.name,
    required this.arguments,
    required this.level,
    required this.gain,
  });
}

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final List<Game> games = [
    Game(name: 'Game 1', arguments: 'Arguments 1', level: 3, gain: 0.1),
    Game(name: 'Game 2', arguments: 'Arguments 2', level: 2, gain: 0.2),
    Game(name: 'Game 3', arguments: 'Arguments 3', level: 1, gain: 0.3),
    Game(name: 'Game 4', arguments: 'Arguments 4', level: 7, gain: 0.4),
    Game(name: 'Game 5', arguments: 'Arguments 5', level: 5, gain: 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    /*
      bar: back button and title
      list of active games
      list of finished games

      each game is represented with a button that navigates to the game. It shows:
        the game name, the game arguments, and the game status with circles
     */
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Games", style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Active games',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return GameListItem(game: games[index]);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Finished games',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return GameListItem(game: games[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: TextButton(
                onPressed: () => print('sss'),
                child: Text('Create new game', style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameListItem extends StatelessWidget {
  final Game game;

  const GameListItem({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(game.name, style: Theme.of(context).textTheme.bodyMedium),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              subtitle: Text(game.arguments, style: Theme.of(context).textTheme.bodySmall),
              onTap: () {
                context.go('/game/${game.name}');
              },
            ),
            const SizedBox(height: 10),
            Row(children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < game.level; i++)
                    const Icon(
                      Icons.circle,
                      color: Color.fromARGB(255, 129, 238, 133),
                      size: 18,
                    ),
                  for (int i = 0; i < TOTAL_LEVELS - game.level; i++)
                    const Icon(
                      Icons.circle,
                      color: Color.fromARGB(255, 201, 199, 199),
                      size: 18,
                    ),
                ],
              ),
              Text(
                'Gain: ${game.gain}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ]),
          ],
        ));
  }
}
