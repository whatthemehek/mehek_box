import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class Data {
  List<Colors> listOfColors;
  List<Colors> listOfDarkColors;
  List<int> listOfWidths;
  List<int> listOfDurations;
  List<String> listOfNames;
  List<List<int>> rhythmArray;
  List<String> labelArray;
  List<double> listOfScales;

  Data ({this.listOfColors, this.listOfDarkColors, this.listOfWidths,
    this.listOfDurations, this.listOfNames, this.rhythmArray,
    this.labelArray, this.listOfScales});
}

final listOfColors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,
                      Colors.brown, Colors.deepOrange[800], Colors.amber[600],
                      Colors.purple, Colors.grey, Colors.pink, Colors.tealAccent[100],
                      Colors.lightGreenAccent[100], Colors.lightGreenAccent[400], Colors.indigo,
                      Colors.black];
final listOfDarkColors = [Colors.red[900], Colors.orange[900], Colors.yellow[900], Colors.green[900], Colors.blue[900],
                          Colors.brown[900], Colors.red[900], Colors.amber[900],
                          Colors.purple[900], Colors.grey[800], Colors.pink[900], Colors.tealAccent[400],
                          Colors.lightGreenAccent[700], Colors.lightGreen[700], Colors.indigo[900],
                          Colors.white];
final listOfWidths = [96, 72, 48, 36, 24, 18, 12, 6, 24, 24, 24, 24, 24, 24, 24, 24];
final listOfDurations = [16, 12, 8, 6, 4, 3, 2, 1, 4, 4, 4, 4, 4, 4, 4, 4];
final listOfNames = ['whole', 'dotHalf', 'half', 'dotQuarter', 'quarter',
                    'dotEighth', 'eighth', 'sixteenth',
                    'oneEAndA', 'oneAnd', 'oneAndA', 'oneEAnd', 'eAndA', 'oneEA', 'oneA', 'quarterRest'];
final rhythmArrays = [[16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16], //1: Whole
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
final labelArray = ['w', 'd', 'h', 'j', ' q', 'i', 'e', 's', 'Y', 'n', 'm', 'M', 'S³', '¾', 'o', 'Q'];
final listOfScales = [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 5.0];
final List<int> measureRhythm = [];
final listOfContainers = [
  for (var j in listOfNames)
    Container(
      child: Center (
        child: Text (
          labelArray[listOfNames.indexOf(j)],
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Musisync',
              color: listOfDarkColors[listOfNames.indexOf(j)],
          ),
          textScaleFactor: listOfScales[listOfNames.indexOf(j)],

        ),
      ),
      width: (listOfWidths[listOfNames.indexOf(j)] * n),
      height: 36 * n,
      decoration: BoxDecoration(
        color: listOfColors[listOfNames.indexOf(j)],
        border: Border.all(
          color: listOfDarkColors[listOfNames.indexOf(j)],
          width: 1,
        ),
      ),
    )
];
var _currentList = [];
int _howFull = 0;


final n = 3.0; // Scale factor for scroll blocks

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mehek Box',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Measure Box'),
          ),
          body: Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container (
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 36*n,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i in listOfContainers)
                            Draggable<Color>(
                              child: i,
                              feedback: Material (
                                child: i,
                              ),
                              childWhenDragging: i,
                              data: listOfColors[(listOfContainers.indexOf(i))],
                              affinity: Axis.vertical,
                            )
                        ]
                    )
                ),
                Expanded(
                    child: Container(
                        color: Color(0xffe4e1),
                        child: BackgroundWidget(),
                    )
                ),
              ]// Children
          ),
      ),
    );
  }
}
class BackgroundWidget extends StatefulWidget {
  @override
  BackgroundWidget({Key key}) : super(key: key);
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
  Widget build(BuildContext context) {

  }
}
class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  bool successfulDrop;
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (BuildContext context, List<int> incoming, List rejected) {
        if (successfulDrop == true) {
          return MeasureBoxWidget();
        } else {
          return MeasureBoxWidget();
        }
      },

      onAccept: (data) {
        setState(() {
          successfulDrop = true;
          _howFull = _howFull - listOfDurations[listOfColors.indexOf(_currentList[data])];
          _currentList.removeAt(data);
        });
      },
      onLeave: (data) {

      },

    );
  }
}
////
////
////
class MeasureBoxWidget extends StatefulWidget {
  @override
  MeasureBoxWidget({Key key}) : super(key: key);
  _MBWidgetState createState() => _MBWidgetState();
  Widget build(BuildContext context) {

  }
}


final AudioCache player = new AudioCache(prefix: 'sounds2/');

class _MBWidgetState extends State<MeasureBoxWidget> {
  int _maxFull = 16;
  @override
  bool successfulDrop;
  bool isButtonEnabled;
  bool complete = false;
  Function _enableButton() {
    isButtonEnabled = (_howFull == _maxFull);
    if (isButtonEnabled) {
      return () {
        measureRhythm.clear();
        for (var l in _currentList) {
          measureRhythm.addAll(rhythmArrays[listOfColors.indexOf(l)]);
        }
        player.clearCache();
        List<String> loadAllArray = [];
        for (int i = 0; i < measureRhythm.length; i++) {
          loadAllArray.add('Index'+ (i + 1).toString() + 'Length' + measureRhythm[i].toString() + '.wav');
          if (measureRhythm[i] != 0) {
            i = i + measureRhythm[i] - 1;
          }
        }
        player.load('metronome.mp3');
        player.loadAll(loadAllArray);
        player.play('metronome.mp3');
        for (String j in loadAllArray) {
          player.play(j);
        }
      };
    } else {
      return null;
    }
  }
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      builder: (BuildContext context, List<Color> incoming, List rejected) {
        if (successfulDrop == true) {
          return Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center (
                child: Container (
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Container (
                        height: 40*n,
                        width: 100*n,
                        decoration: BoxDecoration(
                          color: Color(0xc9c9c9),
                          border: Border.all(
                            color: Colors.white,
                            width: 2*n,
                          ),
                        ),
                        child: Center (
                            child: Row(
                              children: [
                                for (var i in _currentList)
                                  Draggable(
                                    child: listOfContainers[listOfColors.indexOf(i)],
                                    feedback: Material (
                                      child: listOfContainers[listOfColors.indexOf(i)],
                                    ),
                                    childWhenDragging: null,
                                    data: (_currentList.indexOf(i)),
                                  ),
                              ],
                            )
                        )
                    )
                )
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: IconButton (
                      iconSize: 80.0,
                      icon: Icon(Icons.play_circle_filled),
                      color: Colors.blue,
                      disabledColor: Colors.grey,
                      onPressed: _enableButton(),
                  ),
              )
            ]
          );
        } else {
          return Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center (
                    child: Container (
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Container (
                            height: 40*n,
                            width: 100*n,
                            decoration: BoxDecoration(
                              color: Color(0xc9c9c9),
                              border: Border.all(
                                color: Colors.white,
                                width: 2*n,
                              ),
                            ),
                            child: Center (
                                child: Row(
                                  children: [
                                    for (var i in _currentList)
                                      Draggable(
                                        child: listOfContainers[listOfColors.indexOf(i)],
                                        feedback: listOfContainers[listOfColors.indexOf(i)],
                                        childWhenDragging: null,
                                        data: (_currentList.indexOf(i)),
                                      ),
                                  ],
                                )
                            )
                        )
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: IconButton (
                    iconSize: 80.0,
                    icon: Icon(Icons.play_circle_filled),
                    color: Colors.blue,
                    disabledColor: Colors.grey,
                    onPressed: _enableButton(),
                  ),
                )
              ]
          );
        }
      },

      onWillAccept: (data) => listOfDurations[listOfColors.indexOf(data)] + _howFull <= _maxFull,

      onAccept: (data) {
        setState(() {
          successfulDrop = true;
          _howFull = listOfDurations[listOfColors.indexOf(data)] + _howFull;
          _currentList.add(data);
        });
      },
      onLeave: (data) {

      },

    );
  }
}



class FirstPage extends StatelessWidget{
  final Data data;
  FirstPage({this.data});

  @override
  Widget build(BuildContext context) {

  }
}