import 'package:bitbro/pages/course_choose_page.dart';
import 'package:bitbro/pages/course_topics.dart';
import 'package:bitbro/pages/courses_page.dart';
import 'package:bitbro/pages/dashboard_page.dart';
import 'package:bitbro/pages/games_page.dart';
import 'package:bitbro/pages/question_page.dart';
import 'package:bitbro/pages/scoreboard.dart';
import 'package:bitbro/pages/summary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/app_bloc.dart';
import '../pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
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
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const DashboardPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/games',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const GamesPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
              path: '/scoreboard',
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Scoreboard(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  })),
          GoRoute(
            path: '/course_choose',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const CourseChoosePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/courses',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const CoursesPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/question',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const QuestionPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/course_topics',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const CourseTopicsPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/summary',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const SummaryPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
        ]),
  ],
);
