// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  // const TextContainer({super.key});

  const TextContainer(this.text,{super.key});
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white,  fontSize: 28),
      textAlign: TextAlign.left,
    );
  }
}
