import 'package:bitbro/bloc/app_bloc.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../classes/courses/course.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late bool flagSwitch;
  late DraggableScrollableController controller;

  @override
  void initState() {
    super.initState();

    controller = DraggableScrollableController();
    flagSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluScuro,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: const Text('My Career'),
        backgroundColor: bluScuro,
        foregroundColor: bianco,
        actions: [
          TextButton(
              onPressed: () => {
                    setState(() {
                      flagSwitch = !flagSwitch;
                    })
                  },
              child: Text(flagSwitch ? '🇬🇧' : '🇮🇹',
                  style: const TextStyle(
                    fontSize: 28,
                  ))),
          IconButton(
            icon: const Icon(Icons.settings, color: bianco),
            onPressed: () {
              // Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 50),
              child: Text('Sara Spagnoli',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: bianco)),
            ),
            const UserStats(),
          ],
        ),
        DraggableScrollableSheet(
          controller: controller,
          initialChildSize: 0.75,
          minChildSize: 0.75,
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
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  List<Course>? courses = state.activeCourses;

                  if (courses.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Column(children: [
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Text('My Courses',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: bluScuro)),
                          Text("Learn something new and play games!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: bluScuro)),
                          CourseTile(
                            courseName: courses[0].title,
                            courseDescription: courses[0].description,
                            complection: courses[0].completion,
                            index: 0,
                          ),
                          CourseTile(
                            courseName: courses[1].title,
                            courseDescription: courses[1].description,
                            complection: courses[1].completion,
                            index: 1,
                          ),
                          CourseTile(
                            courseName: courses[2].title,
                            courseDescription: courses[2].description,
                            complection: courses[2].completion,
                            index: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.push('/courses');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(bluScuro),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsetsDirectional.all(20)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Text('FIND NEW COURSE',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: bianco)),
                      ),
                    ),
                  ]);
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String courseName;
  final String courseDescription;
  final int complection;
  final int index;

  const CourseTile({
    super.key,
    required this.courseName,
    required this.courseDescription,
    required this.complection,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bloc event
        context.read<AppBloc>().add(ChangeCourse(index));
        GoRouter.of(context).push('/');
      },
      child: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: griginoSfondo,
          child: ListTile(
            title: Text(courseName,
                style: const TextStyle(color: bluScuro, fontSize: 16)),
            subtitle: Text(courseDescription,
                style: const TextStyle(color: bluScuro, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            trailing: Text('$complection%',
                style: const TextStyle(color: bluScuro, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

class UserStats extends StatelessWidget {
  const UserStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlayerStat(title: 'Level', value: '69'),
            PlayerStat(title: 'Win rate', value: '96%'),
            PlayerStat(title: 'Max profit', value: '\$69M'),
          ],
        ),
      ]),
    );
  }
}

class PlayerStat extends StatelessWidget {
  final String title;
  final String value;

  const PlayerStat({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
