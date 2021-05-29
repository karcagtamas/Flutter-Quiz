import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final void Function(int) answerQuestion;
  final int questionIndex;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) {
          return Answer(
              () => answerQuestion(e['score'] as int), e['text'] as String);
        }).toList(),
      ],
    );
  }
}
