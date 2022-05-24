import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onSelect;

  Answer(this.text, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        child: Text(text),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.black,
        textColor: Colors.grey,
        onPressed: onSelect,
      ),
    );
  }
}
