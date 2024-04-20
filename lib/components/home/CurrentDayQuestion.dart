import 'package:bitbro/classes/question.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CurrentDayQuestion extends StatelessWidget {
  const CurrentDayQuestion({super.key, this.q});

  final Question? q;

  @override
  Widget build(BuildContext context) {
    if (q == null) {
      return const Text('No question for today');
    }

    return Column(
      children: [
        const Text(
          "Game master has a question for you!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        GestureDetector(
          onTap: () {
            /* context.read().add(const ); */
            GoRouter.of(context).push("/question");
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: griginoSfondo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(q!.question, textAlign: TextAlign.start),
                Container(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/icon/expand.svg',
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
