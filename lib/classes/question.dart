class Question {
  Question({
    this.updates,
    required this.question,
    required this.answer,
    this.gain,
  });
  final String question;
  final String? answer;

  final Map<String, int>? updates;

  // diff from last day
  final int? gain;
}
