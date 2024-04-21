import 'package:bitbro/classes/question.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/styles.dart';
import '../Container2Elements.dart';

class SummaryLastDay extends StatelessWidget {
  const SummaryLastDay({super.key, this.q});

  final Question? q;

  @override
  Widget build(BuildContext context) {
    if (q?.summary == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Yesterday’s summary ",
          style: text24Blu500,
        ),
        const Text(
          "Actions have consequences! Look what happened in yesterday’s round!",
          style: text18Blue300,
        ),
        GestureDetector(
          onTap: () {
            /* context.read().add(const ); */
            GoRouter.of(context).push("/summary");
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: griginoSfondo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q!.summary!, textAlign: TextAlign.start),
                      Container(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          'assets/icon/expand.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                q?.gain != null
                    ? Builder(builder: (context) {
                        bool isPositive;

                        String parsedGain;

                        if (q!.gain! > 0) {
                          isPositive = true;
                          parsedGain = "+";
                        } else {
                          isPositive = false;
                          parsedGain = "";
                        }

                        TextStyle style =
                            isPositive ? text14Green500 : text14Red500;

                        parsedGain += q!.gain!.toStringAsFixed(2);
                        return Container2Elements(
                            firstText: "Result",
                            text: parsedGain,
                            style: style);
                      })
                    : const SizedBox.shrink()
              ],
            ),
          ),
        )
      ],
    );
  }
}
