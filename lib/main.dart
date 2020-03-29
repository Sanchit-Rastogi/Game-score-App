import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/game.dart';
import 'views/englishRules.dart';
import 'views/gameArabic.dart';
import 'views/arabicRules.dart';
import 'views/arabicInstructions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        'game': (context) => Game(),
        'englishRules': (context) => EnglishRules(),
        'gameArabic': (context) => GameArabic(),
        'arabicRules': (context) => ArabicRules(),
        'arabicInstructions': (context) => ArabicInstructions(),
      },
    );
  }
}
