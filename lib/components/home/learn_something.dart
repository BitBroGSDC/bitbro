import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    return Padding(
      padding: const EdgeInsets.only(top : 16.0),
      child: Column(
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
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Topic topic = course!.topics[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push("/lesson");
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: bluScuro,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(topic.title, style: text18Bianco500)),
                          Container(
                            alignment: Alignment.centerRight,
                            constraints: const BoxConstraints(minWidth: 50),
                            child: Text(
                              topic.level,
                              style: text14Green500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(topic.description, style: text14Bianco300),
                    ],
                  ),
                ),
              );
            },
            itemCount: course?.topics.length,
          ),
        ],
      ),
    );
  }
}
