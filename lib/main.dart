import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/game.dart';
import 'views/englishRules.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        'game': (context) => Game(),
        'englishRules': (context) => EnglishRules(),
      },
    );
  }
}
