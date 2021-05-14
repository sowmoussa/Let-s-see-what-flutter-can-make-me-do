import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  Result(this.totalScore, this.reset);

  String get resultPhrase {
    var resultText = "You did it";
    if (totalScore == 0) {
      resultText = "You good";
    } else if (totalScore < -2) {
      resultText = "You probably sick, keep distance";
    } else {
      resultText = "Go Test yourself please !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: reset,
            child: Text('Restart Quiz'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
          )
        ],
      ),
    );
  }
}
