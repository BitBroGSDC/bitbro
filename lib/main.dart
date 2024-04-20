import 'package:bitbro/pages/games_page.dart';
import 'package:bitbro/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BitBroApp());
}

class BitBroApp extends StatelessWidget {
  BitBroApp({super.key});

  final GoRouter _rtr = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomePage(title: 'Home Page'),
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
      )
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _rtr,
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF33404F),
          scaffoldBackgroundColor: Colors.grey[100],
          hoverColor: Colors.white.withOpacity(0.6),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
            titleMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
            bodySmall: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          )),
    );
  }
}
