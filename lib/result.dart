import 'package:flutter/material.dart';

class TextResult {
  var type;
  var description;
}

class Result extends StatelessWidget {
  final int totalScore;
  final resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  TextResult get resultPhrase {
    TextResult txtResult = TextResult();
    txtResult.type = '';
    txtResult.description = '';

    if (totalScore >= 0 && totalScore <= 12) {
      txtResult.type = 'You are an INTROVERTED PERSON!';
      txtResult.description =
          'An introvert is a person with qualities of a personality type known as introversion, which means that they feel more comfortable focusing on their inner thoughts and ideas, rather than what is happening externally. They enjoy spending time with just one or two people, rather than large groups or crowds.';
    } else if (totalScore > 12 && totalScore <= 18) {
      txtResult.type = 'You are an AMBIVERTED PERSON!';
      txtResult.description =
          'An ambivert is someone who exhibits qualities of both introversion and extroversion, and can flip into either depending on their mood, context, and goals.';
    } else if (totalScore > 18 && totalScore <= 25) {
      txtResult.type = 'You are an EXTROVERTED PERSON!';
      txtResult.description =
          'a person whose personality is characterized by extroversion : a typically gregarious and unreserved person who enjoys and seeks out social interaction';
    } else {
      txtResult.type = 'na';
      txtResult.description = 'na';
    }
    return txtResult;
  }

  @override
  Widget build(BuildContext context) {
    var RESULT = resultPhrase;

    return Center(
      child: Column(
        children: [
          Text(
            RESULT.type,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Text(
              RESULT.description,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            child: Text('Restart Quiz!'),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
