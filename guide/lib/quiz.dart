import 'package:flutter/material.dart';
import 'package:guide/answer.dart';
import 'package:guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final Function answerQ;

  Quiz(
      {@required this.questions, @required this.answerQ, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText']),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) =>
                Answer(() => answerQ(answer['score']), answer['label']))
            .toList()
      ],
    );
  }
}
