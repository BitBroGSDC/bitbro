import 'package:bitbro/components/home/homegraph.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/home/CurrentDayQuestion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DraggableScrollableController controller;

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluScuro,
      body: Stack(children: [
        HomeGraph(
          top: 'Tizio',
          bottom: 'Caio',
          you: 'Sempronio',
          topData: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
          bottomData: const [10, 9, 8, 7, 6, 5, 4, 3, 2, 1],
          youData: const [5, 6, 7, 8, 9, 10, 9, 8, 7, 6],
          navigateToFullScoreboard: () {
            context.go('/scoreboard');
          },
        ),
        DraggableScrollableSheet(
          controller: controller,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              decoration: const BoxDecoration(
                color: bianco,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: const <Widget>[
                  SizedBox(height: 10),
                  CurrentDayQuestion(),
                  SizedBox(height: 10),
                  /* SummaryLastDay(), */
                  SizedBox(height: 10),
                  /*  LearnSomething(), */
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
