import 'custom_paragraph.dart';

class Topic {
  Topic({
    required this.title,
    required this.description,
    required this.paragraphs,
    this.level = 'beginner',
  });
  String title;
  String description;
  String level;

  List<CustomParagraph> paragraphs;
}
