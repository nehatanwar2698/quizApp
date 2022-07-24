import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:quiz_app/widget/answer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  int selectedAnswerIndex = 0;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  bool showCorrectAnswer = false;

  void _questionAnswered(bool answerScore, index) {
    print("indexedTapped $index");
    setState(() {
      // if answer tapped
      selectedAnswerIndex = index;
      answerWasSelected = true;
      showCorrectAnswer = true;
      // check answer correct or not
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // now adding scoretracker
      _scoreTracker.add(answerScore
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.clear, color: Colors.red));
      // when quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
      showCorrectAnswer = false;
      // what happend when end of quiz
      if (_questionIndex >= _questions.length) {
        _questionIndex = 0;
        _totalScore = 0;
        _scoreTracker = [];
        endOfQuiz = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Quiz App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                  margin:
                      EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Q.${_questionIndex + 1}  ${_questions[_questionIndex]['question'].toString()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                ...(_questions[_questionIndex]['answers'] as List<Map>)
                    .mapIndexed((index, answer) {
                  return Answer(
                    answerTap: () {
                      // if answer was already selected  then nothing happend on tap

                      if (answerWasSelected) {
                        return;
                      }
                      _questionAnswered(answer['score'], index);
                    },
                    answerIndex: "${index + 1}",
                    answerText: answer['answerText'],
                    answerColor:
                        answerWasSelected && selectedAnswerIndex == index
                            ? correctAnswerSelected
                                ? Colors.green
                                : Colors.red
                            : answer['score'] && showCorrectAnswer
                                ? Colors.green
                                : null,
                    // answerColor: answerWasSelected
                    //     ? answer['score']
                    //         ? Colors.green
                    //         : Colors.red
                    //     : null,
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.minPositive, 40)),
                    onPressed: () {
                      if (!answerWasSelected) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Please select answer before going to next question")));
                        return;
                      }
                      _nextQuestion();
                    },
                    child: Text(endOfQuiz ? "Restart Quiz" : "Next Question")),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "${_totalScore}/${_questions.length}",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                if (answerWasSelected && !endOfQuiz)
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: correctAnswerSelected ? Colors.green : Colors.red,
                    child: Center(
                        child: Text(
                      correctAnswerSelected
                          ? "well done,you got it right"
                          : "Wrong :/  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                if (endOfQuiz)
                  Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          _totalScore > 4
                              ? "Congratulations! your final score is :$_totalScore"
                              : "your final score is :$_totalScore. Better luck next time",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  _totalScore > 4 ? Colors.green : Colors.red),
                        ),
                      ))
              ],
            ),
          ),
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
