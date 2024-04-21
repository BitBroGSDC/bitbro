// ignore_for_file: prefer_const_constructors

import 'package:bitbro/utils/colors.dart';
import 'package:flutter/material.dart';
import '../components/appbar_go_back.dart';
import '../components/bordered_button.dart';

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
            left: 10,
            right: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topicTile(topicName: 'Introduction to Python'),
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
                      topicTile(topicName: 'Python Basics'),
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
                      topicTile(topicName: 'Python Intermediate'),
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
                      topicTile(topicName: 'Python Advanced'),
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
                      topicTile(topicName: 'Python Projects'),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Progess',
                      //   style: TextStyle(fontSize: 14, color: bianco),
                      // ),
                      BorderedButton(textButton: 'GO TO GAMES'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class topicTile extends StatelessWidget {
  final String topicName;
  const topicTile({
    super.key,
    required this.topicName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.book_outlined,
                color: bianco,
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
        ));
  }
}
