import 'package:bitbro/classes/question.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../classes/courses/course.dart';
import '../../classes/courses/topic.dart';
import '../../utils/styles.dart';

class LearnSomething extends StatelessWidget {
  const LearnSomething({super.key, this.course});

  final Course? course;

  @override
  Widget build(BuildContext context) {
    if (course == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Learn Something! ",
          style: text24Blu500,
        ),
        const Text(
          "The Game Master has some interesting courses tailored for you.",
          style: text18Blue300,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            Topic topic = course!.topics[index];
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(topic.title, style: text18Blue300),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: course?.topics.length,
        )
      ],
    );
  }
}
