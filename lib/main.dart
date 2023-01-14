import 'package:app/result.dart';
import 'package:app/quiz.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Introvert/Extroverted Personality Test'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: Text(
                'Welcome to the Intro/Extro-VERT Personality Test!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              child: const Text('START'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'To prepare for a night out...',
      'answers': [
        {
          'text':
              'I buy the latest outfit, tell my friends, then dance the night away',
          'score': 5
        },
        {
          'text':
              'Call a few of my closest friends to see if they will be there',
          'score': 3
        },
        {
          'text': 'Prepare? My friends have to drag me out most nights',
          'score': 1
        },
      ]
    },
    {
      'questionText': 'Being around people makes me feel...',
      'answers': [
        {'text': 'Like I\'m alive!', 'score': 5},
        {
          'text':
              'Inspired. I feed off of others\' energy but there are times when I\'d rather be alone.',
          'score': 3
        },
        {
          'text': 'A bit exhausted. Being around others can be draining.',
          'score': 1
        },
      ]
    },
    {
      'questionText': 'What\'s your idea of the perfect date?',
      'answers': [
        {'text': 'A live concert in Central Park.', 'score': 5},
        {'text': 'Dinner and a Broadway show', 'score': 3},
        {'text': 'Wine and Netflix', 'score': 1},
      ]
    },
    {
      'questionText':
          'People describe you as thoughtful, reserved, and soft-spoken',
      'answers': [
        {'text': 'Never, I am a very talkative person', 'score': 5},
        {
          'text':
              'Sometimes but I can also be quite talkative with my inner circle',
          'score': 3
        },
        {
          'text': 'All the time, I am a very quiet and mellow person',
          'score': 1
        },
      ]
    },
    {
      'questionText': 'How do you prefer to communicate?',
      'answers': [
        {'text': 'In person', 'score': 5},
        {
          'text': 'Call me first then we\'ll meet up if you need to elaborate',
          'score': 3
        },
        {'text': 'Just text, email, or chat.', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var scoreSheet = [];

  void _goBack() {
    if (_questionIndex > 0) {
      _totalScore -= scoreSheet.last as int;
      scoreSheet.removeAt(scoreSheet.length - 1);

      setState(() {
        _questionIndex -= 1;
      });
    } else {}
  }

  void _resetQuiz() {
    setState(() {
      scoreSheet.clear();
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    scoreSheet.add(score);
    print(scoreSheet);
    _totalScore += score;
    print('Total Score');
    print(_totalScore);

    if (_questionIndex < _questions.length) {
      print(".");
    }

    setState(() {
      _questionIndex += 1;
    });
    print('QUESTION INDEX:');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Introvert/Extroverted Personality Test'),
          backgroundColor: Color.fromRGBO(56, 75, 145, 0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => _goBack(),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
