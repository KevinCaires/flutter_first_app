import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() reset;

  Result(this.score, this.reset);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reset?',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: reset,
          color: Colors.black,
          textColor: Colors.grey,
        )
      ],
    );
  }
}
