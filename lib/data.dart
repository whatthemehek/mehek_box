part of 'main.dart';

final n = 3.0;

final measureListOfColors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,
  Colors.brown, Colors.deepOrange[800], Colors.amber[600],
  Colors.purple, Colors.grey, Colors.pink, Colors.tealAccent[100],
  Colors.lightGreenAccent[100], Colors.lightGreenAccent[400], Colors.indigo,
  Colors.black];
final measureListOfDarkColors = [Colors.red[900], Colors.orange[900], Colors.yellow[900], Colors.green[900], Colors.blue[900],
  Colors.brown[900], Colors.red[900], Colors.amber[900],
  Colors.purple[900], Colors.grey[800], Colors.pink[900], Colors.tealAccent[400],
  Colors.lightGreenAccent[700], Colors.lightGreen[700], Colors.indigo[900],
  Colors.white];
final measureListOfWidths = [96, 72, 48, 36, 24, 18, 12, 6, 24, 24, 24, 24, 24, 24, 24, 24];
final measureListOfDurations = [16, 12, 8, 6, 4, 3, 2, 1, 4, 4, 4, 4, 4, 4, 4, 4];
final measureListOfNames = ['whole', 'dotHalf', 'half', 'dotQuarter', 'quarter',
  'dotEighth', 'eighth', 'sixteenth',
  'oneEAndA', 'oneAnd', 'oneAndA', 'oneEAnd', 'eAndA', 'oneEA', 'oneA', 'quarterRest'];
final measureRhythmArrays = [[16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16], //1: Whole
  [12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12], //2: Dot Half
  [8, 8, 8, 8, 8, 8, 8, 8], //3: Half
  [6, 6, 6, 6, 6, 6], //4: Dot Quarter
  [4, 4, 4, 4], //5: Quarter
  [3, 3, 3], //6: Dot Eighth
  [2, 2], //Eighth
  [1], //Sixteenth
  [1, 1, 1, 1], //One E And A
  [2, 2, 2, 2], //One And
  [2, 2, 1, 1], //One And A
  [1, 1, 2, 2], //One E And
  [0, 1, 1, 1], //E And A
  [1, 2, 2, 1], //One E A
  [3, 3, 3, 1], //One A
  [0, 0, 0, 0], //Quarter Rest
];
final measureLabelArray = ['w', 'd', 'h', 'j', ' q', 'i', 'e', 's', 'Y', 'n', 'm', 'M', 'S³', '¾', 'o', 'Q'];
final measureListOfScales = [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 5.0];

