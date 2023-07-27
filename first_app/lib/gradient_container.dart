import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.start, this.end, {super.key});

  const GradientContainer.purple({super.key})
      : start = Colors.deepPurple,
        end = Colors.indigo;

  final Color start;
  final Color end;

  

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [start, end], begin: startAlignment, end: endAlignment),
              ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
