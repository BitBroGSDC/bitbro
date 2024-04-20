import 'package:bitbro/pages/games_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes:  [
        GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomePage(),
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
  ],
);
