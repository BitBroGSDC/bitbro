import 'package:bitbro/components/home/homegraph.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bitbro/bloc/app_bloc.dart';
import 'package:bitbro/classes/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/home/CurrentDayQuestion.dart';
import '../components/button.dart';
import '../components/home/summary_last_paragraph.dart';
import '../utils/styles.dart';

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
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              decoration: const BoxDecoration(
                color: bianco,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  final Question? q = state.selectedQuestion;

                  final Question? q2 = state.questionOfLastDay;

                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Today's quest",
                            style: textBlue24Medium,
                          ),
                          Button(
                            height: 28,
                            text: 'HISTORY',
                            onPressed: () {
                              /* context.read().add(const ); */
                            },
                            isExpandable: false,
                            suffix: Icons.arrow_forward,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CurrentDayQuestion(q: q),
                      const SizedBox(height: 24),
                      SummaryLastDay(q: q2),
                      SizedBox(height: 10),
                      /*  LearnSomething(), */
                    ],
                  );
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
