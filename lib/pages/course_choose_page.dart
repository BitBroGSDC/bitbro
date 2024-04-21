import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../components/user_text_field.dart';

class CourseChoosePage extends StatefulWidget {
  const CourseChoosePage({super.key});

  @override
  State<CourseChoosePage> createState() => _CourseChoosePageState();
}

class _CourseChoosePageState extends State<CourseChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Tell us more...",
            style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Ionicons.arrow_back, color: Colors.white),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
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
            const Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  CourseTile(
                    courseName: 'Course 1',
                    courseDescription: 'Course 1 description',
                    complection: 50,
                  )
                ]),
              ),
            ),
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                child: TextButton(
                  onPressed: () => print('a'),
                  child: Text('SEE AL COURSES',
                      style: Theme.of(context).textTheme.titleMedium),
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
