import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.backToMain, required this.chosenAnswers});
  final void Function() backToMain;
  final List<String> chosenAnswers;

  //a special getter function
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final totalNumOfQuestions = questions.length;
    var correctNumOfQuestions = 0;

    final List<Color> colorsList = [];
    for (int dataIndex = 0; dataIndex < summaryData.length; dataIndex++) {
      if (summaryData[dataIndex]['user_answer'] ==
          summaryData[dataIndex]['correct_answer']) {
        correctNumOfQuestions++;
        colorsList.add(const Color.fromARGB(255, 82, 215, 153));
      } else {
        colorsList.add(const Color.fromARGB(255, 228, 81, 55));
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered $correctNumOfQuestions out of $totalNumOfQuestions questions correctly!',
            style: const TextStyle(
              color: Color.fromARGB(255, 193, 175, 235),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Summary(summaryData, colorsList),
          const SizedBox(height: 30),
          FilledButton.icon(
            onPressed: backToMain,
            icon: const Icon(Icons.restart_alt_sharp,
                color: Color.fromARGB(255, 26, 1, 136)),
            label: const Text('Restart Quiz!'),
          )
        ]),
      ),
    );
  }
}
