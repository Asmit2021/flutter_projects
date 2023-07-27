import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;
  
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'res/images/ques.jpeg',
          width: 200,
          //color: Color.fromARGB(0, 255, 255, 255),//Another way of setting opacity more optimisied
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'res/images/ques.jpeg',
        //     width: 200,
        //   ),{less optimised method, must be ignored}
        // ),
        const SizedBox(height: 20),
        Text(
          'Learn Flutter the fun way',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
