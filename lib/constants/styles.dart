import 'package:flutter/material.dart';

const kFlatButtonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);

const kHintTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

const kRaisedButtonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 18,
);

const kScoreTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 30,
  fontWeight: FontWeight.w600,
);

const kEnglishRuleTextStyle = TextStyle(
  fontSize: 17,
);

const kEnglishInstructions1 = Text(
  "Each player receives 12 cards in batches of 4. The remaining cards form a widow, to be taken up by the player who makes a contract. Starting with eldest hand, the players bid (in multiples of 5) for the privilege of taking up the widow and making trumps. The minimum bid is 100, and there are 175 points in the game. A player who does not want to overbid the previous bid may pass, but cannot bid again later in the same round. The highest bidder becomes declarer, takes up the widow, and discards cards face down to return to the original number of cards (12). The discarded pile becomes the declarer's team's first trick (including any points).",
  style: kEnglishRuleTextStyle,
);

const kEnglishInstructions2 = Text(
  "Declarer leads to the first trick. The suit of the card led becomes the trump suit. The remainder of the deal is played according to the standard trick-play rules as in Whist or Hokm. The cards discarded by the highest bidder count for declarer's party as in most comparable games, or for the winner of the last trick as in Rook.",
  style: kEnglishRuleTextStyle,
);

const kEnglishInstructions3 = Text(
  "Each party makes the card-points in tricks won plus 5 points for every trick. If declarer's party is successful, they score what they made, or 260 points if they win all tricks (i.e., achieve a shelem or slam). If they are not successful, they lose what they bid. The opponents always score precisely what they made. There's no penalty for scoring points above the bid amount.",
  style: kEnglishRuleTextStyle,
);

const kEnglishInstructions4 = Text(
  "A   K     Q     J     10    9     8     7   6  5  4  3   2 10  -     -     -     10    -     -     -   -  5  -  -   -",
  style: kEnglishRuleTextStyle,
);

const kArabicInstructions1 = Text(
  "كل لاعب يحصل على 12 بطاقة و الزائد يبقى في الأرض.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions2 = Text(
  "اللاعب الأعلى مزايدة يحصل على الكروت الزائدة و يقوم بالاخيار ثم يقوم باخراج كروت ليتبقى في يده 12 كرت.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions3 = Text(
  "تكون االمزايدات بمضاعفات  الخمسة.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions4 = Text(
  "تبدا المزايدات من 105 الى 175 في البرنامج نختصر الرقم 105 ب 5 10 15 الى 75.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions5 = Text(
  "يجبر اللاعب الأعلى مزايدة بلعب كرت الحكم في أول جولة.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions6 = Text(
  "في حال إدخال الجوكر يعتبر الجوكر أقوى كرت حكم.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions7 = Text(
  "تقوم اللعبة على نفس قوانين الحكم في اللعب.",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions8 = Text(
  "تتوزع النقاط كالتالي:",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions9 = Text(
  "A	K	Q	J	10	9	8	7	6	5	4	3	2",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions10 = Text(
  "10	-	-	-	10	-	-	-	-	5	-	-	-",
  style: kEnglishRuleTextStyle,
);
const kArabicInstructions11 = Text(
  "و الجوكر في حال إضافته يساوي عشر نقاط.",
  style: kEnglishRuleTextStyle,
);
