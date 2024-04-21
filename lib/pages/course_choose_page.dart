import 'package:bitbro/components/appbar_go_back.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/app_bloc.dart';
import '../classes/courses/course.dart';
import '../components/user_text_field.dart';
import '../utils/styles.dart';

class CourseChoosePage extends StatefulWidget {
  const CourseChoosePage({super.key});

  @override
  State<CourseChoosePage> createState() => _CourseChoosePageState();
}

class _CourseChoosePageState extends State<CourseChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGoBack(
        title: "Tell us more...",
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final Course? currCourse = state.currentCourse;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '     Don\'t worry, you can always change your mind!',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                const SizedBox(height: 20),
                const Text(
                  'What are you interested in?',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                // white rounded textfield
                // q: how i set it multiline?
                // a: set maxLines to null
                const UserTextField(),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: CourseTile(
                          courseName: currCourse?.title ?? "Titolo Corso",
                          courseDescription:
                              currCourse?.description ?? 'Course 1 description',
                          complection: 50,
                          is3Lines: true,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.push('/courses');
                      },
                      child: const Text(
                        'SEE AL COURSES',
                        style: text20Bianco500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String courseName;
  final String courseDescription;
  final int complection;
  final bool is3Lines;

  const CourseTile({
    super.key,
    required this.courseName,
    required this.courseDescription,
    required this.complection,
    this.is3Lines = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: griginoSfondo,
        child: ListTile(
          title: Text(courseName,
              style: const TextStyle(color: bluScuro, fontSize: 16)),
          subtitle: Text(
            courseDescription,
            style: const TextStyle(color: bluScuro, fontSize: 12),
            maxLines: is3Lines ? 3 : null,
            overflow: is3Lines ? TextOverflow.ellipsis : null,
          ),
          trailing: Text('$complection%',
              style: const TextStyle(color: bluScuro, fontSize: 16)),
        ),
      ),
    );
  }
}
