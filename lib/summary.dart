//This widget represents the summary screen widget
import 'package:flutter/material.dart';




class Summary extends StatelessWidget {
  const Summary(this.summaryData, this.colorsList, {super.key});

  final List<Map<String, Object>> summaryData;
  final List<Color> colorsList;
  

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          //the map method
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Container(
                    
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorsList[data['question_index'] as int],
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  
                  child: Padding(
                    padding:const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        Text(data['question'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.start,), 
                        const SizedBox(
                          height: 2,
                        ),
                        Text(data['user_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 193, 175, 235)), textAlign: TextAlign.start,),
                        const SizedBox(height: 2),
                        Text(data['correct_answer'] as String, style: const TextStyle(color:  Color.fromARGB(255, 82, 215, 153)), textAlign: TextAlign.start,),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(), //to list converts the iterable to a list
        ),
      ),
    );
  }
}
