import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  const AnswerButton({ required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40
        ),
        backgroundColor:const Color.fromARGB(255, 80, 53, 230),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40),
         ),
      ),
      child: Text(answer, textAlign: TextAlign.center,),
    );
  
  }
}