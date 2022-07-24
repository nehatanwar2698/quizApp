import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String answerText;
  String answerIndex;
  final answerColor;

  final VoidCallback answerTap;
  Answer(
      {required this.answerText,
      this.answerColor,
      required this.answerTap,
      required this.answerIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: answerColor,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text.rich(TextSpan(
            text: "${answerIndex}.  ",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            children: <InlineSpan>[
              TextSpan(
                text: answerText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )
            ])),
      ),
    );
  }
}
