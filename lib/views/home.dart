import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alisshelemios/constants/styles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customFlatButton(' عربي', () {
              Navigator.pushNamed(context, 'gameArabic');
            }),
            customFlatButton('English', () {
              Navigator.pushNamed(context, 'game');
            }),
          ],
        ),
      ),
    );
  }

  Widget customFlatButton(String fillText, Function onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18, horizontal: 0),
      width: 250,
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        color: Colors.grey[200],
        onPressed: onPressed,
        child: Text(
          fillText,
          style: kFlatButtonTextStyle,
        ),
      ),
    );
  }
}
