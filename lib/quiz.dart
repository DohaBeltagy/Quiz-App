import 'package:flutter/material.dart';
import 'package:quizapp/questions_scree.dart';
import 'package:quizapp/main_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> chosenAnswers = [];
  var activeScreen = 'main-screen';

  void switchScreen() {
    setState(() {
      //setState in a state class, flutter re-execute the build method
      activeScreen = 'quiz-screen';
    });
  }

  void switchToMain(){
    setState(() {
      activeScreen = 'main-screen';
    });
  }

  void chooseAnswer(String answer)
  {
    chosenAnswers.add(answer);

    if(chosenAnswers.length == questions.length)
    {
      
      setState(() {
        activeScreen = 'final-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = MainScreen(switchScreen);
    if(activeScreen == 'quiz-screen')
    { 
      screenWidget =  QuestionsScreen(chooseAnswer);
    }
   if(activeScreen == 'final-screen')
    {
      screenWidget =  ResultsScreen(backToMain: switchToMain, chosenAnswers: chosenAnswers,);
    }
    if(activeScreen == 'main-screen')
    {
      chosenAnswers = [];
      screenWidget = MainScreen(switchScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 22, 1, 136),
            Color.fromARGB(255, 18, 1, 95),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: screenWidget,
        ),
      ),
    );
  }
}
