import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';

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
        /* WidgetTommi(), */
        DraggableScrollableSheet(
          controller: controller,
          initialChildSize: 0.6,
          minChildSize: 0.6,
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
