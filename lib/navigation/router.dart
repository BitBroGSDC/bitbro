import 'package:bitbro/pages/dashboard_page.dart';
import 'package:bitbro/pages/games_page.dart';
import 'package:bitbro/pages/scoreboard.dart';
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
              BlocProvider(create: (context) => AppBloc()..add(const AppInit())),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const HomePage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const DashboardPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
            path: '/games',
            pageBuilder: (context, state) => CustomTransitionPage(
                child: const GamesPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                }),
          ),
          GoRoute(
              path: '/scoreboard',
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Scoreboard(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  })),
        ])
  ],
);
