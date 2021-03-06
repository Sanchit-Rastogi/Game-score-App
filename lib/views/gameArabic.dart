import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:alisshelemios/constants/styles.dart';
import 'package:alisshelemios/constants/values.dart';
import 'package:firebase_admob/firebase_admob.dart';

class GameArabic extends StatefulWidget {
  @override
  _GameArabicState createState() => _GameArabicState();
}

class _GameArabicState extends State<GameArabic> {
  int dropDownValue = 5;
  int bidValue = 0;
  int team2Bid = 0;
  int team1Bid = 0;
  int team1Score = 0;
  int team2Score = 0;
  bool team1 = false;
  bool team2 = false;
  List<int> team1Scores = [];
  List<int> team2Scores = [];
  int count = 0;

  final myController = TextEditingController();

  String currentDevice = '';

  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    keywords: <String>['game', 'shelem', 'card', 'score', 'win'],
    testDevices: <String>[],
  );

  BannerAd bannerAd = BannerAd(
    adUnitId: 'ca-app-pub-2037047472590211/4646955042',
    size: AdSize.smartBanner,
    targetingInfo: targetInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  InterstitialAd interstitialAd = InterstitialAd(
    adUnitId: 'ca-app-pub-2037047472590211/1775936047',
    targetingInfo: targetInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-2037047472590211~5715181052');
    bannerAd
      ..load()
      ..show(
        anchorOffset: 60.0,
        horizontalCenterOffset: 10.0,
        anchorType: AnchorType.bottom,
      );
  }

  void assignValue() {
    int value = int.parse(myController.text);
    print('team1 bool value $team1');
    print('team2 bool value $team2');
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
        title: Text('شلم'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final action = CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text("قوانين اللعبة"),
                      onPressed: () {
                        Navigator.pushNamed(context, 'arabicRules');
                      },
                    ),
                  ],
                );
                showCupertinoModalPopup(
                    context: context, builder: (context) => action);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customTextField('اسم الفريق الثاني', 150),
                  customTextField('اسم الفريق الاول', 150),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton('طلعة الفريق الثاني', () {
                    setState(() {
                      bidValue = dropDownValue;
                      team2Bid = bidValue;
                      team2 = true;
                      team1 = false;
                    });
                  }, 125),
                  customDropDown(),
                  customButton('طلعة الفريق الاول', () {
                    setState(() {
                      bidValue = dropDownValue;
                      team1Bid = bidValue;
                      team1 = true;
                      team2 = false;
                    });
                  }, 125),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customButton('احسب', () {
                    count++;
                    if (count % 3 == 0) {
                      interstitialAd
                        ..load()
                        ..show();
                    }
                    assignValue();
                    if (team1 == true) {
                      int check = 80 - team1Bid;
                      if (check > team2Bid) {
                        setState(() {
                          team1Score = 100 + (75 - team2Bid);
                          (team1Scores.length == 0)
                              ? team1Scores.add(team1Score)
                              : team1Scores.add(team1Scores.last + team1Score);
                          team2Score = team2Bid;
                          (team2Scores.length == 0)
                              ? team2Scores.add(team2Score)
                              : team2Scores.add(team2Scores.last + team2Score);
                        });
                      } else {
                        setState(() {
                          team1Score = -100 + (-team1Bid);
                          (team1Scores.length == 0)
                              ? team1Scores.add(team1Score)
                              : team1Scores.add(team1Scores.last + team1Score);
                          team2Score = team2Bid;
                          (team2Scores.length == 0)
                              ? team2Scores.add(team2Score)
                              : team2Scores.add(team2Scores.last + team2Score);
                        });
                      }
                    } else {
                      int check = 80 - team2Bid;
                      if (check > team1Bid) {
                        setState(() {
                          team1Score = team1Bid;
                          (team1Scores.length == 0)
                              ? team1Scores.add(team1Score)
                              : team1Scores.add(team1Scores.last + team1Score);
                          team2Score = 100 + (75 - team1Bid);
                          (team2Scores.length == 0)
                              ? team2Scores.add(team2Score)
                              : team2Scores.add(team2Scores.last + team2Score);
                        });
                      } else {
                        setState(() {
                          team1Score = team1Bid;
                          (team1Scores.length == 0)
                              ? team1Scores.add(team1Score)
                              : team1Scores.add(team1Scores.last + team1Score);
                          team2Score = -100 + (-team2Bid);
                          (team2Scores.length == 0)
                              ? team2Scores.add(team2Score)
                              : team2Scores.add(team2Scores.last + team2Score);
                        });
                      }
                    }
                  }, 125),
                  FlatButton(
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        if (team1Scores.length > 0) {
                          (team1Scores.length == 1)
                              ? team1Scores.clear()
                              : team1Scores.removeLast();
                        }
                        if (team2Scores.length > 0) {
                          (team2Scores.length == 1)
                              ? team2Scores.clear()
                              : team2Scores.removeLast();
                        }
                      });
                    },
                  ),
                  valueTextField('نقاط الخصم', 100),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    scoreBoard(team2Scores),
                    Text(
                      bidValue.toString(),
                      style: TextStyle(
                          fontSize: 30, decoration: TextDecoration.underline),
                    ),
                    scoreBoard(team1Scores),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customButton('لعبة جديدة', () {
                    setState(() {
                      team1Bid = 0;
                      team1 = false;
                      team1Score = 0;
                      team2 = false;
                      team2Bid = 0;
                      team2Score = 0;
                      bidValue = 0;
                      dropDownValue = 5;
                      team2Scores.clear();
                      team1Scores.clear();
                      myController.clear();
                    });
                  }, 150),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton('شلم', () {
                    setState(() {
                      team2Scores.isEmpty
                          ? team2Scores.add(260)
                          : team2Scores.add(team2Scores.last + 260);
                      team1Scores.isEmpty
                          ? team1Scores.add(-260)
                          : team1Scores.add(team1Scores.last - 260);
                    });
                  }, 140),
                  customButton('شلم', () {
                    setState(() {
                      team1Scores.isEmpty
                          ? team1Scores.add(260)
                          : team1Scores.add(team1Scores.last + 260);
                      team2Scores.isEmpty
                          ? team2Scores.add(-260)
                          : team2Scores.add(team2Scores.last - 260);
                    });
                  }, 140),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton('زيد 260', () {
                    setState(() {
                      team2Scores.isEmpty
                          ? team2Scores.add(260)
                          : team2Scores.add(team2Scores.last + 260);
                      team1Scores.isEmpty
                          ? team1Scores.add(0)
                          : team1Scores.add(team1Scores.last);
                    });
                  }, 140),
                  customButton('زيد 260', () {
                    setState(() {
                      team1Scores.isEmpty
                          ? team1Scores.add(260)
                          : team1Scores.add(team1Scores.last + 260);
                      team2Scores.isEmpty
                          ? team2Scores.add(0)
                          : team2Scores.add(team2Scores.last);
                    });
                  }, 140),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton('نقص 260', () {
                    setState(() {
                      team2Scores.isEmpty
                          ? team2Scores.add(-260)
                          : team2Scores.add(team2Scores.last - 260);
                      team1Scores.isEmpty
                          ? team1Scores.add(0)
                          : team1Scores.add(team1Scores.last);
                    });
                  }, 140),
                  customButton('نقص 260', () {
                    setState(() {
                      team1Scores.isEmpty
                          ? team1Scores.add(-260)
                          : team1Scores.add(team1Scores.last - 260);
                      team2Scores.isEmpty
                          ? team2Scores.add(0)
                          : team2Scores.add(team2Scores.last);
                    });
                  }, 140),
                ],
              )
            ],
          ),
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

  Widget scoreBoard(List<int> scores) {
    return Container(
      width: 100,
      color: Colors.blue,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: scores.length,
        itemBuilder: (context, index) {
          return Text(
            scores[index].toString(),
            style: kScoreTextStyle,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
