import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MainScreen extends StatelessWidget {
  const MainScreen(this.startQuiz,
      {super.key}); //the key is passed to the parent which is stateless

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            "Quiz Time!!",
            style: TextStyle(
            fontSize: 40,
            foreground: Paint()
            ..shader = ui.Gradient.linear(
        const Offset(0, 20),
        const Offset(450, 20),
        <Color>[
         const Color.fromARGB(255, 239, 113, 239),
         const Color.fromARGB(255, 110, 214, 255),
        ],
      )
  ),
          ),
          const SizedBox(height: 48), //Spacer
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            fit: BoxFit.cover,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          const SizedBox(height: 48),
          ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  foregroundColor: const Color.fromARGB(255, 193, 175, 235),
                  textStyle: const TextStyle(fontSize: 24)),
              icon: const Icon(Icons.arrow_forward_rounded,
                  color: Color.fromARGB(255, 26, 1, 136)),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Color.fromARGB(255, 26, 1, 136)),
              ))
        ],
      ),
    );
  }
}
