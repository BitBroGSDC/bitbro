import 'package:bitbro/classes/courses/topic.dart';

class Course {
  Course({
    required this.title,
    required this.description,
    required this.topics,
  });

  String title;

  String description;
  List<Topic> topics;
}
