import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../classes/courses/course.dart';
import '../components/appbar_go_back.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGoBack(
        title: "All Courses",
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 0),
                decoration: const BoxDecoration(
                  color: bianco,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    List<Course>? courses = state.activeCourses;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return CourseTile(
                          courseName: courses[index].title,
                          courseDescription: courses[index].description,
                        );
                      },
                      itemCount: courses.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String courseName;
  final String courseDescription;
  final int? complection;

  const CourseTile({
    super.key,
    required this.courseName,
    required this.courseDescription,
    this.complection,
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
          subtitle: Text(courseDescription,
              style: const TextStyle(color: bluScuro, fontSize: 12)),
          trailing: complection != null
              ? Text('$complection%',
                  style: const TextStyle(color: bluScuro, fontSize: 16))
              : null,
        ),
      ),
    );
  }
}
