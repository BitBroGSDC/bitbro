class Question {
  Question({required this.question, required this.answer, this.submitted = false, this.opinion, this.result});
  final String question;
  final String answer;
  final bool submitted;

  final String? opinion;

  // diff from last day
  final int? result;
}