import 'package:flutter/material.dart';

Padding CustomFont({required String text, required double? size}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: Text(
      text,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

class StudentData {
  final String category;
  final double percentage;

  StudentData(this.category, this.percentage);
}

class StudentDataoverall {
  final String category;
  final double percentage;
  final String text;

  StudentDataoverall(this.category, this.percentage, this.text);
}
