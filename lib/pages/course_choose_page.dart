import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

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
        title: Text("Tell us more...", style: Theme.of(context).textTheme.titleLarge),
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
            UserTextField(),
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
                  child: Text('SEE AL COURSES', style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'I\'m interested in...',
              border: InputBorder.none,
            ),
            // come aggiungo un bottone interno?
          ),
          Positioned(
            right: 0,
            bottom: 5,
            child: TextButton(
              onPressed: () => print('a'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsetsDirectional.all(15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text('SUBMIT', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
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
          title: Text(courseName, style: const TextStyle(color: bluScuro, fontSize: 16)),
          subtitle: Text(courseDescription, style: const TextStyle(color: bluScuro, fontSize: 12)),
          trailing: Text('$complection%', style: const TextStyle(color: bluScuro, fontSize: 16)),
        ),
      ),
    );
  }
}
