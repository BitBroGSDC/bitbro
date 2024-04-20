class Question {
  Question({
    this.updates,
    required this.question,
    required this.answer,
    this.gain,
    this.summary,
  });
  final String question;
  final String? answer;
  final String? summary;

  final Map<String, int>? updates;

  // diff from last day
  final int? gain;
}
