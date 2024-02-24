import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
      {super.key}); //the key is passed to the parent which is stateless

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Quiz Time!!",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 48), //Spacer
          Image.asset('assets/images/quiz-logo.png',
              width: 200, fit: BoxFit.cover, color: const Color.fromARGB(155, 255, 255, 255), ),
          const SizedBox(height: 48),
          ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  foregroundColor: Colors.amber.shade50,
                  textStyle: const TextStyle(fontSize: 24)),
                  icon: const Icon(
                    Icons.arrow_forward_rounded, 
                    color:Color.fromARGB(255, 26, 1, 136)),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Color.fromARGB(255, 26, 1, 136)),
              ))
        ],
      ),
    );
  }
}
