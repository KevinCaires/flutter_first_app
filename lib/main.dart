import 'package:flutter/material.dart';
import 'quiz.dart';
import './result.dart';

void main() {
  // runApp(new AppQuestion());
  runApp(AppQuestionState());
}

// Class State auxiliar para o widget com estado.
class AppState extends State<AppQuestionState> {
  var _selected = 0;
  var _score = 0;
  // O '_' seta um método ou atributo como privado a folha de código.
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'What is your favorite color?',
      'answer': [
        {'text': 'Black', 'points': 10},
        {'text': 'Grey', 'points': 5},
        {'text': 'White', 'points': 1},
      ],
    },
    {
      'text': 'What is your favorite animal?',
      'answer': [
        {'text': 'Cat', 'points': 10},
        {'text': 'Dog', 'points': 5},
        {'text': 'Bird', 'points': 1},
      ],
    },
    {
      'text': 'What is your favorite food?',
      'answer': [
        {'text': 'Fruits', 'points': 10},
        {'text': 'Pizza', 'points': 5},
        {'text': 'Fast food', 'points': 1},
      ],
    },
  ];

  //Função que controla o estado da aplicaçao.
  void _answer(int score) {
    if (hasSelectedAnswer) {
      setState(() {
        _selected++;
        _score += score;
      });
    }
  }

  void reset() {
    setState(() {
      _selected = 0;
      _score = 0;
    });
  }

  bool get hasSelectedAnswer {
    return _selected < _questions.length;
  }

  // Cria um método do tipo widget
  // Que recebe um argumento do tipo BuildContext.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Define a barra principal do app.
        appBar: AppBar(
          centerTitle: true,
          title: Text('Questions'),
          backgroundColor: Colors.black,
        ),
        // Define o corpo da aplicação.
        body: hasSelectedAnswer
            ? Quiz(
                selected: _selected,
                questions: _questions,
                answer: _answer,
              )
            : Result(_score, reset),
      ),
    );
  }
}

// Criando um widget com estado.
class AppQuestionState extends StatefulWidget {
  // @override
  AppState createState() {
    return AppState();
  }
}
