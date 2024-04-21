// ignore_for_file: prefer_const_constructors

import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/app_bloc.dart';
import '../classes/courses/course.dart';
import '../components/appbar_go_back.dart';

class CourseTopicsPage extends StatefulWidget {
  const CourseTopicsPage({super.key});

  @override
  State<CourseTopicsPage> createState() => _CourseTopicsPageState();
}

class _CourseTopicsPageState extends State<CourseTopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarGoBack(
          title: 'Course Topics',
        ),
        backgroundColor: bluScuro,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 40,
          ),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              final Course? course = state.currentCourse;

              if (course == null) {
                return const Center(
                  child: Text(
                    'No Course Selected',
                    style: TextStyle(
                      fontSize: 18,
                      color: bianco,
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: course.topics.length,
                  itemBuilder: (context, index) {
                    if (index == course.topics.length - 1) {
                      return TopicTile(
                        topicName: course.topics[index].title,
                        isCompleted: course.topics[index].isCompleted,
                        onTap: () {
                          context
                              .read<AppBloc>()
                              .add(SelectTopic(course.topics[index]));
                          GoRouter.of(context).push('/topic_details');
                        },
                      );
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopicTile(
                          topicName: course.topics[index].title,
                          isCompleted: course.topics[index].isCompleted,
                          onTap: () {
                            context
                                .read<AppBloc>()
                                .add(SelectTopic(course.topics[index]));
                            GoRouter.of(context).push('/topic_details');
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(
                              Icons.linear_scale,
                              color: bianco,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}

class TopicTile extends StatelessWidget {
  final String topicName;
  final bool isCompleted;
  final Function()? onTap;
  const TopicTile({
    super.key,
    required this.topicName,
    required this.isCompleted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.only(bottom: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isCompleted ? verdeBrillante : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.book_outlined,
                  color: isCompleted ? bluScuro : bianco,
                ),
              ),
              // Spacer(),
              Container(
                width: 250,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: bianco,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  topicName,
                  style: const TextStyle(
                    fontSize: 18,
                    backgroundColor: bianco,
                    color: bluScuro,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
