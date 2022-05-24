import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  // runApp(new AppQuestion());
  runApp(AppQuestionState());
}

// Class State auxiliar para o widget com estado.
class AppState extends State<AppQuestionState> {
  var selected = 0;
  final List<Map<String, Object>> questions = [
    {
      'text': 'What is your favorite color?',
      'answer': ['Black', 'White', 'Grey'],
    },
    {
      'text': 'What is your favorite animal?',
      'answer': ['Dog', 'Cat', 'Bird'],
    },
    {
      'text': 'What is your favorite food?',
      'answer': ['Pizza', 'Fruits', 'Fast food'],
    },
  ];

  //Função de responsta.
  void _answer() {
    setState(() {
      if (selected < (questions.length - 1)) {
        selected++;
      } else {
        selected = 0;
      }
    });
  }

  // Cria um método do tipo widget
  // Que recebe um argumento do tipo BuildContext.
  @override
  Widget build(BuildContext context) {
    List<Widget> responses = [];

    for (var answer in questions[selected].cast()['answer']) {
      responses.add(Answer(answer, _answer));
    }

    return MaterialApp(
      home: Scaffold(
        // Define a barra principal do app.
        appBar: AppBar(
          title: Text('Questions'),
          backgroundColor: Colors.black,
        ),
        // Define o corpo da aplicação.
        body: Column(
          children: <Widget>[
            Question(questions[selected]['text'].toString()),
            // Mostra o conteúdo das respostas de forma iterável.
            ...responses,
          ],
        ),
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
