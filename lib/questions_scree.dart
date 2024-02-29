import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var quesIndex = 0;

  void answerQues(String chosenAnswer) {
    widget.onSelectedAnswer(chosenAnswer);
    setState(() {
      quesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion =
        questions[quesIndex]; //get the first question from the list of questions

    return SizedBox(
      width: double.infinity,
      child: Container(
        //added for margin
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Color.fromARGB(255, 193, 175, 235),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // spread to individual values
            ...currentQuestion.shuffled.map((i) {
              return AnswerButton(
                answer: i,
                onTap: () {
                  answerQues(i);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
