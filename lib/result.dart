import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  Result(this.score);

  String get textResult {
    if (score <= 10) {
      return 'Yungling';
    } else if (score <= 20) {
      return 'Padawan';
    } else if (score < 30) {
      return 'Jedi';
    } else {
      return 'Chosen one';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Center(
        child: Text(
          textResult,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
