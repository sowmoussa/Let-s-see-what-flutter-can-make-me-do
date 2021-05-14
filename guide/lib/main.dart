import 'package:flutter/material.dart';
import 'package:guide/quiz.dart';
import 'package:guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var _totalScore = 0;

  static const questions = [
    {
      'questionText':
          'Ces dernières 48 heures, quelle a été votre température la plus élevée ?',
      'answers': [
        {'label': '37 degrés', 'score': 0},
        {'label': 'moins de 37 degrés', 'score': -1},
        {'label': 'plus de 37 degrés', 'score': -1}
      ]
    },
    {
      'questionText':
          'Ces derniers jours, avez-vous une toux ou votre toux habituelle s’est-elle modifiée ?',
      'answers': [
        {'label': 'Oui', 'score': -1},
        {'label': 'Non', 'score': 0}
      ]
    },
    {
      'questionText':
          'Ces derniers jours, avez-vous noté une perte ou une forte diminution de votre goût ou de votre odorat ?',
      'answers': [
        {'label': 'Oui', 'score': -1},
        {'label': 'Non', 'score': 0}
      ]
    },
    {
      'questionText':
          'Ces derniers jours, avez-vous eu un mal de gorge et/ou des douleurs musculaires et/ou des courbatures inhabituelles et/ou des maux de tête inhabituels ?',
      'answers': [
        {'label': 'Oui', 'score': -1},
        {'label': 'Non', 'score': 0}
      ]
    },
  ];

  void _answerQ(int score) {
    _totalScore += score;

    setState(() {
      _index = _index + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: _index < questions.length
            ? Quiz(
                answerQ: _answerQ,
                questions: questions,
                index: _index,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
