import 'package:bitbro/components/home/homegraph.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bitbro/bloc/app_bloc.dart';
import 'package:bitbro/classes/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../classes/courses/course.dart';
import '../components/appbar_go_back.dart';
import '../components/home/current_day_question.dart';
import '../components/button.dart';
import '../components/home/learn_something.dart';
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
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      final Question? q = state.selectedQuestion;
      final Question? q2 = state.questionOfLastDay;
      final Course? course = state.currentCourse;

      final game = state.currGame!;

      return Scaffold(
        appBar: AppBarGoBack(
          title: game.gameName,
          icon: const Icon(Ionicons.chevron_down_circle, color: Colors.white),
          onIconPressed: () {
            context.push("/games");
          },
        ),
        backgroundColor: bluScuro,
        body: Stack(children: [
          HomeGraph(
            top: game.scoreboard.entries.first.key,
            bottom: game.scoreboard.entries.last.key,
            you: game.userName,
            topData: game.scoreboard.entries.first.value,
            bottomData: game.scoreboard.entries.last.value,
            youData: game.scoreboard[game.userName]!,
            navigateToFullScoreboard: () {
              context.push('/scoreboard');
            },
          ),
          DraggableScrollableSheet(
            controller: controller,
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 1,
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
                child: ListView(
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
                            GoRouter.of(context).push('/history');
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
                    const SizedBox(height: 10),
                    LearnSomething(
                      course: course,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ]),
      );
    });
  }
}
