class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffled() {
     final shuffledList = List.of(answers);
     shuffledList.shuffle(); //this is called chaining
    return shuffledList;
  }
}