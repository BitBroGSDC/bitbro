import 'package:bitbro/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BitBroApp());
}

class BitBroApp extends StatelessWidget {
  const BitBroApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF33404F),
          scaffoldBackgroundColor: Colors.grey[100],
          hoverColor: Colors.white.withOpacity(0.6),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
            titleMedium: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            bodySmall: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          )),
    );
  }
}
