import 'custom_paragraph.dart';

class Topic {
  Topic({
    required this.title,
    required this.description,
    required this.paragraphs,
    this.level = 'beginner',
    this.isCompleted = false,
  });
  final String title;
  final String description;
  final String level;
  final bool isCompleted;

  final List<CustomParagraph> paragraphs;

  //copywith
  Topic copyWith({
    String? title,
    String? description,
    String? level,
    bool? isCompleted,
    List<CustomParagraph>? paragraphs,
  }) {
    return Topic(
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      isCompleted: isCompleted ?? this.isCompleted,
      paragraphs: paragraphs ?? this.paragraphs,
    );
  }
}
