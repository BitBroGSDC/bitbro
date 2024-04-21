import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Theme.of(context).primaryColor,
        title:
            Text("All Courses", style: Theme.of(context).textTheme.titleLarge),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              decoration: const BoxDecoration(
                color: bianco,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    CourseTile(
                      courseName: 'Course 1',
                      courseDescription: 'Course 1 description',
                      complection: 50,
                    ),
                    CourseTile(
                      courseName: 'Course 2',
                      courseDescription: 'Course 2 description',
                      complection: 50,
                    ),
                    CourseTile(
                      courseName: 'Course 3',
                      courseDescription: 'Course 3 description',
                      complection: 50,
                    ),
                    CourseTile(
                      courseName: 'Course 4',
                      courseDescription: 'Course 4 description',
                      complection: 50,
                    ),
                  ],
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
  final int complection;

  const CourseTile({
    super.key,
    required this.courseName,
    required this.courseDescription,
    required this.complection,
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
          trailing: Text('$complection%',
              style: const TextStyle(color: bluScuro, fontSize: 16)),
        ),
      ),
    );
  }
}
