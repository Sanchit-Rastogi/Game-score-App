import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alisshelemios/constants/styles.dart';
import 'package:alisshelemios/constants/values.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int dropDownValue = 5;
  int bidValue = 0;
  int team2Bid = 0;
  int team1Bid = 0;
  int team1Score = 0;
  int team2Score = 0;
  bool team1 = false;
  bool team2 = false;

  final myController = TextEditingController();

  void assignValue() {
    int value = int.parse(myController.text);
    if (team1 == true) {
      setState(() {
        team2Bid = value;
      });
      print('$team2Bid = team 2 bid change');
    } else {
      setState(() {
        team1Bid = value;
      });
      print('$team1Bid = team 1 bid change');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Shelem'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customTextField('TEAM 2 NAME', 150),
                customTextField('TEAM 1 NAME', 150),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customButton('TEAM 2 ORDER', () {
                  setState(() {
                    bidValue = dropDownValue;
                    team2Bid = bidValue;
                    team2 = true;
                  });
                }, 150),
                customDropDown(),
                customButton('TEAM 1 ORDER', () {
                  setState(() {
                    bidValue = dropDownValue;
                    team1Bid = bidValue;
                    team1 = true;
                  });
                }, 150),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                customButton('CALCULATE', () {
                  assignValue();
                  if (team1 == true) {
                    int check = 75 - team2Bid;
                    if (check < team1Bid) {
                      setState(() {
                        team1Score = check + 100;
                        team2Score = team2Bid;
                      });
                    } else {
                      setState(() {
                        team1Score = team1Bid;
                        team2Score = check + 100;
                      });
                    }
                  } else {
                    int check = 75 - team1Bid;
                    if (check < team2Bid) {
                      setState(() {
                        team1Score = team1Bid;
                        team2Score = check + 100;
                      });
                    } else {
                      setState(() {
                        team1Score = check + 100;
                        team2Score = team2Bid;
                      });
                    }
                  }
                }, 125),
                FlatButton(
                  child: Icon(
                    Icons.refresh,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                valueTextField('OTHER TEAM GAIN POINTS', 150),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                scoreBox(team2Score.toString(), 100, 50),
                Text(
                  bidValue.toString(),
                  style: TextStyle(
                      fontSize: 30, decoration: TextDecoration.underline),
                ),
                scoreBox(team1Score.toString(), 100, 50),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customButton('NEW GAME', () {}, 150),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customButton('SHLM FOR TEAM 2', () {}, 140),
                customButton('SHLM FOR TEAM 1', () {}, 140),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customButton('ADD 260 FOR TEAM 2', () {}, 140),
                customButton('ADD 260 FOR TEAM 1', () {}, 140),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                customButton('SUBTRACT 260 FROM TEAM 2', () {}, 140),
                customButton('SUBTRACT 260 FROM TEAM 1', () {}, 140),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(String childText, Function onPressed, double width) {
    return Container(
      width: width,
      child: CupertinoButton(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        onPressed: onPressed,
        child: Text(
          childText,
          textAlign: TextAlign.center,
          style: kRaisedButtonTextStyle,
        ),
      ),
    );
  }

  Widget customDropDown() {
    return DropdownButton<int>(
      value: dropDownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      underline: null,
      onChanged: (int newValue) {
        setState(() {
          dropDownValue = newValue;
        });
      },
      items: kDropDownValues.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }

  Widget customTextField(String hintText, double width) {
    return Container(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget valueTextField(String hintText, double width) {
    return Container(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kHintTextStyle,
        ),
        controller: myController,
      ),
    );
  }

  Widget scoreBox(String score, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          score,
          style: kScoreTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
