import 'custom_paragraph.dart';

class Topic {
  Topic({
    required this.title,
    required this.description,
    required this.paragraphs,
  });
  String title;
  String description;

  List<CustomParagraph> paragraphs;
}
