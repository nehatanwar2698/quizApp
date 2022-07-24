import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: null,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          "hjkhdhhssgdhgh",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
