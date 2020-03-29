import 'package:flutter/material.dart';
import 'package:alisshelemios/constants/styles.dart';

class EnglishRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Rules'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: <Widget>[
                kEnglishInstructions1,
                SizedBox(
                  height: 10,
                ),
                kEnglishInstructions2,
                SizedBox(
                  height: 10,
                ),
                kEnglishInstructions3,
                SizedBox(
                  height: 10,
                ),
                kEnglishInstructions4
              ],
            )),
      ),
    );
  }
}
