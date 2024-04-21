import 'package:bitbro/classes/courses/topic.dart';
import 'package:bitbro/pages/course_choose_page.dart';
import 'package:bitbro/pages/course_topics.dart';
import 'package:bitbro/pages/courses_page.dart';
import 'package:bitbro/pages/dashboard_page.dart';
import 'package:bitbro/pages/games_page.dart';
import 'package:bitbro/pages/question_page.dart';
import 'package:bitbro/pages/scoreboard.dart';
import 'package:bitbro/pages/summary_page.dart';
import 'package:bitbro/pages/topic_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/app_bloc.dart';
import '../pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => AppBloc()..add(const AppInit())),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const MaterialPage(child: HomePage()),
          ),
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                const MaterialPage(child: DashboardPage()),
          ),
          GoRoute(
            path: '/games',
            pageBuilder: (context, state) =>
                const MaterialPage(child: GamesPage()),
          ),
          GoRoute(
            path: '/scoreboard',
            pageBuilder: (context, state) =>
                const MaterialPage(child: Scoreboard()),
          ),
          GoRoute(
            path: '/course_choose',
            pageBuilder: (context, state) =>
                const MaterialPage(child: CourseChoosePage()),
          ),
          GoRoute(
            path: '/courses',
            pageBuilder: (context, state) =>
                const MaterialPage(child: CoursesPage()),
          ),
          GoRoute(
            path: '/question',
            pageBuilder: (context, state) =>
                const MaterialPage(child: QuestionPage()),
          ),
          GoRoute(
            path: '/course_topics',
            pageBuilder: (context, state) =>
                const MaterialPage(child: CourseTopicsPage()),
          ),
          GoRoute(
            path: '/summary',
            pageBuilder: (context, state) =>
                const MaterialPage(child: SummaryPage()),
          ),
          GoRoute(
            path: '/topic_details',
            pageBuilder: (context, state) =>
                const MaterialPage(child: TopicDetails()),
          ),
        ]),
  ],
);
