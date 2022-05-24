import 'package:flutter/material.dart';
import 'package:project/answer.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int selected;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  Quiz({
    required this.selected,
    required this.questions,
    required this.answer,
  });

  bool get hasSelectedAnswer {
    return selected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // Retorna as perguntas se ainda hover índice disponível. Senão retorna vazio.
    List<Map<String, Object>> responses =
        // If in line no dart.
        hasSelectedAnswer ? questions[selected].cast()['answer'] : [];

    return Column(
      children: <Widget>[
        Question(questions[selected]['text'].toString()),
        // Mostra o conteúdo das respostas de forma iterável
        // Usando uma arrow function para realizar o map do conteúdo.
        ...responses.map((r) {
          return Answer(r['text'].toString(),
              () => answer(int.parse(r['points'].toString())));
        }).toList(),
      ],
    );
  }
}
