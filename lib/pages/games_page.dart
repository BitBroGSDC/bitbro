import 'package:bitbro/components/appbar_go_back.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../classes/game_data.dart';
import '../components/bordered_button.dart';

const int TOTAL_LEVELS = 7;

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGoBack(
        title: 'Games',
      ),
      backgroundColor: bluScuro,
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final List<GameData> active_games =
              state.currentCourse?.activeGames ?? [];

          final List<GameData> past_games =
              state.currentCourse?.pastGames ?? [];

          return Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active Games',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: active_games.length,
                        itemBuilder: (context, index) {
                          return GameListItem(game: active_games[index]);
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
                        itemCount: past_games.length,
                        itemBuilder: (context, index) {
                          return GameListItem(game: past_games[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              /* Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                child: const BorderedButton(textButton: 'SEE ALL GAMES'),
              ), */
            ],
          );
        },
      ),
    );
  }
}

class GameListItem extends StatelessWidget {
  final GameData game;
  int gain = 0;

  // definisci il costruttore in modo da ottenere game e calolcare il gain
  GameListItem({required this.game}) {
    if (game.questions.isNotEmpty) {
      gain = game.questions[game.questions.length - 1]!.gain!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        child: Column(
          children: [
            ListTile(
              title: Text(game.gameName,
                  style: Theme.of(context).textTheme.bodyMedium),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              subtitle: Text(game.topic,
                  style: Theme.of(context).textTheme.bodySmall),
              onTap: () {
                // context.go('/game/${game.name}');
                // TODO set that game as active and go to the game page
              },
              trailing: const Icon(Icons.arrow_forward),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(children: [
                Row(
                  // circles
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 1; i < TOTAL_LEVELS; i++)
                      Icon(
                        Icons.circle,
                        color: (game.questions.length > i
                            ? Colors.green
                            : game.questions.length == i
                                ? Colors.orange
                                : Colors.grey),
                        size: 18,
                      ),
                  ],
                ),
                const Spacer(flex: 3),
                Text(
                  "${gain >= 0 ? '+' : ''}${gain}\$",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: gain > 0 ? Colors.green : Colors.red,
                      ),
                  textAlign: TextAlign.right,
                ),
              ]),
            ),
          ],
        ));
  }
}
