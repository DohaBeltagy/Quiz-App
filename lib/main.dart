import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return  MaterialApp(
      home: Scaffold(
        body:Container( 
          decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [
               Color.fromARGB(255, 22, 1, 136),
               Color.fromARGB(255, 18, 1, 95),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )),
          child: const MainScreen(),
          )
      ),
    );
  }
}
