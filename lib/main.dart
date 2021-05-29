import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 2},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 4},
        {'text': 'Spider', 'score': 8},
        {'text': 'Lion', 'score': 12},
      ]
    },
    {
      'questionText': 'Wher are you live?',
      'answers': [
        {'text': 'Gyor', 'score': 20},
        {'text': 'Budapest', 'score': 15},
        {'text': 'New York', 'score': 7},
        {'text': 'Tokyo', 'score': 2},
      ]
    },
  ];
  var _index = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    print(score);
    setState(() {
      _index++;
      _totalScore += score;
    });
    print(_index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: _index < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _index,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
