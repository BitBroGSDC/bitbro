import 'package:bitbro/classes/courses/topic.dart';
import 'package:bitbro/classes/game_data.dart';

import 'custom_paragraph.dart';

class Course {
  Course({
    required this.title,
    required this.description,
    required this.topics,
    this.activeGames = const [],
  });

  String title;

  String description;
  List<Topic> topics;
  List<GameData> activeGames;

  
}

List<Course> courses = [
  Course(
    title: 'Course 1',
    description: 'Description 1',
    topics: [
      Topic(
        title: 'Topic 1',
        description: 'Description 1',
        paragraphs: [
          CustomParagraph(text: "This is a paragraph with text"),
          CustomParagraph(text: "This is a paragraph with text"),
        ],
      ),
      Topic(
        title: 'Topic 2',
        description: 'Description 2',
        paragraphs: [
          CustomParagraph(text: "This is a paragraph with text"),
          CustomParagraph(text: "This is a paragraph with text"),
        ],
      ),
    ],
  ),
  Course(
    title: 'Course 2',
    description: 'Description 2',
    topics: [
      Topic(
        title: 'Topic 1',
        description: 'Description 1',
        paragraphs: [
          CustomParagraph(text: "This is a paragraph with text"),
          CustomParagraph(text: "This is a paragraph with text"),
        ],
      ),
      Topic(
        title: 'Topic 2',
        description: 'Description 2',
        paragraphs: [
          CustomParagraph(text: "This is a paragraph with text"),
          CustomParagraph(text: "This is a paragraph with text"),
        ],
      ),
    ],
  ),
];
