import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  var value = questions.length;
  void answerQuestion(String selectedAnswer) {
    
    
      widget.onSelectAnswer(selectedAnswer);
      setState(() {
        currentQuestionIndex++;
      });
    
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 196, 122, 245),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswer().map((answer) {
                return AnswerButton(
                    answer: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              }), //dynamicaly genrated
              // AnswerButton(answer: currentQuestion.answers[0], onTap: () {}),
              // AnswerButton(answer: currentQuestion.answers[1], onTap: () {}),
              // AnswerButton(answer: currentQuestion.answers[2], onTap: () {}),
              // AnswerButton(answer: currentQuestion.answers[3], onTap: () {}),
            ]),
      ),
    );
  }
}
