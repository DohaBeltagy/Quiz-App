import 'package:flutter/material.dart';
import 'package:quizapp/questions_scree.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      //setState in a state class, flutter re-execute the build method
      activeScreen = 'quiz-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = MainScreen(switchScreen);
    if(activeScreen == 'quiz-screen')
    { 
      screenWidget = const QuestionsScreen();
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
