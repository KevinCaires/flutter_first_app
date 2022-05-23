import 'package:flutter/material.dart';
import './question.dart';

void main() {
  // runApp(new AppQuestion());
  runApp(AppQuestionState());
}

// Class State auxiliar para o widget com estado.
class AppState extends State<AppQuestionState> {
  var selected = 0;

  //Função de responsta.
  void _answer() {
    setState(() {
      selected++;
    });
  }

  // Cria um método do tipo widget
  // Que recebe um argumento do tipo BuildContext.
  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'What is your favorite color?',
      'What is your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        // Define a barra principal do app.
        appBar: AppBar(
          title: Text('Questions'),
        ),
        // Define o corpo da aplicação.
        body: Column(
          children: <Widget>[
            Question(questions[selected]),
            RaisedButton(
              child: Text('Answer one.'),
              onPressed: _answer,
            ),
            RaisedButton(
              child: Text('Answer two.'),
              onPressed: _answer,
            ),
            RaisedButton(
              child: Text('Answer three.'),
              onPressed: _answer,
            ),
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
