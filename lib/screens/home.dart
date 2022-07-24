import 'package:flutter/material.dart';
import 'package:quiz_app/widget/answer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int totalScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Quiz App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 25,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                _questions[_questionIndex]['question'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Answer(),
           
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40)),
                onPressed: () {},
                child: Text("Next Question")),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "0/9",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  final _questions = const [
    {
      'question': 'How long is New Zealand’s Ninety Mile Beach?',
      'answers': [
        {'answerText': '88km, so 55 miles long.', 'score': true},
        {'answerText': '55km, so 34 miles long.', 'score': false},
        {'answerText': '90km, so 56 miles long.', 'score': false},
      ],
    },
    {
      'question':
          'In which month does the German festival of Oktoberfest mostly take place?',
      'answers': [
        {'answerText': 'January', 'score': false},
        {'answerText': 'October', 'score': false},
        {'answerText': 'September', 'score': true},
      ],
    },
    {
      'question': 'Who composed the music for Sonic the Hedgehog 3?',
      'answers': [
        {'answerText': 'Britney Spears', 'score': false},
        {'answerText': 'Timbaland', 'score': false},
        {'answerText': 'Michael Jackson', 'score': true},
      ],
    },
    {
      'question':
          'In Georgia (the state), it’s illegal to eat what with a fork?',
      'answers': [
        {'answerText': 'Hamburgers', 'score': false},
        {'answerText': 'Fried chicken', 'score': true},
        {'answerText': 'Pizza', 'score': false},
      ],
    },
    {
      'question':
          'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
      'answers': [
        {'answerText': 'His tongue', 'score': true},
        {'answerText': 'His leg', 'score': false},
        {'answerText': 'His butt', 'score': false},
      ],
    },
    {
      'question': 'In which country are Panama hats made?',
      'answers': [
        {'answerText': 'Ecuador', 'score': true},
        {'answerText': 'Panama (duh)', 'score': false},
        {'answerText': 'Portugal', 'score': false},
      ],
    },
    {
      'question': 'From which country do French fries originate?',
      'answers': [
        {'answerText': 'Belgium', 'score': true},
        {'answerText': 'France (duh)', 'score': false},
        {'answerText': 'Switzerland', 'score': false},
      ],
    },
    {
      'question': 'Which sea creature has three hearts?',
      'answers': [
        {'answerText': 'Great White Sharks', 'score': false},
        {'answerText': 'Killer Whales', 'score': false},
        {'answerText': 'The Octopus', 'score': true},
      ],
    },
    {
      'question': 'Which European country eats the most chocolate per capita?',
      'answers': [
        {'answerText': 'Belgium', 'score': false},
        {'answerText': 'The Netherlands', 'score': false},
        {'answerText': 'Switzerland', 'score': true},
      ],
    },
  ];
}
