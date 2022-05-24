import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  // runApp(new AppQuestion());
  runApp(AppQuestionState());
}

// Class State auxiliar para o widget com estado.
class AppState extends State<AppQuestionState> {
  var _selected = 0;
  // O '_' seta um método ou atributo como privado a folha de código.
  final List<Map<String, Object>> _questions = const [
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
    if (hasSelectedAnswer) {
      setState(() {
        _selected++;
      });
    }
  }

  bool get hasSelectedAnswer {
    return _selected < _questions.length;
  }

  // Cria um método do tipo widget
  // Que recebe um argumento do tipo BuildContext.
  @override
  Widget build(BuildContext context) {
    // Retorna as perguntas se ainda hover índice disponível. Senão retorna vazio.
    List<String> responses =
        // If in line do dart.
        hasSelectedAnswer ? _questions[_selected].cast()['answer'] : [];

    return MaterialApp(
      home: Scaffold(
        // Define a barra principal do app.
        appBar: AppBar(
          title: Text('Questions'),
          backgroundColor: Colors.black,
        ),
        // Define o corpo da aplicação.
        body: hasSelectedAnswer
            ? Column(
                children: <Widget>[
                  Question(_questions[_selected]['text'].toString()),
                  // Mostra o conteúdo das respostas de forma iterável
                  // Usando uma arrow function para realizar o map do conteúdo.
                  ...responses.map((t) => Answer(t, _answer)).toList(),
                ],
              )
            : null,
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
