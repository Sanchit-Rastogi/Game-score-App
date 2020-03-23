import 'package:flutter/material.dart';
import 'package:alisshelemios/constants/styles.dart';

class ArabicRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' قوانين اللعبة'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            kArabicInstructions1,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions2,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions3,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions4,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions5,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions6,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions7,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions8,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions9,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions10,
            SizedBox(
              height: 5,
            ),
            kArabicInstructions11,
          ],
        ),
      ),
    );
  }
}
