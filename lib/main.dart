import 'package:bitbro/navigation/router.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness:
        Brightness.light, // For iOS (dark icons) // transparent status bar
  ));
  runApp(const BitBroApp());
}

class BitBroApp extends StatelessWidget {
  const BitBroApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: router,
      builder: (context, child) => Container(
        color: bluScuro,
        child: SafeArea(child: child!),
      ),
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF33404F),
          scaffoldBackgroundColor: Colors.grey[100],
          hoverColor: Colors.white.withOpacity(0.6),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
            titleMedium: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            bodySmall: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          )),
    );
  }
}
