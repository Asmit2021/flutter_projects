import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    shape: const CircleBorder(eccentricity: 0.0),
                    backgroundColor: data['user_answer'] == data['correct_answer']?Colors.green:Colors.red,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ), //child widget inside this button
                    onPressed: () {
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(data['question'] as String,
                            style: const TextStyle(color: Colors.white,
                            fontSize: 15,
                            ),
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(data['user_answer'] as String,
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.grey,
                            fontSize: 12,
                            ),
                            ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),    
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(data['correct_answer'] as String,
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.blue,
                            fontSize: 12,
                            ),),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
