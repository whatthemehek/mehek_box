import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final listOfColors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,
                      Colors.brown, Colors.deepOrange[800], Colors.amber[600],
                      Colors.purple, Colors.grey, Colors.pink, Colors.tealAccent[100],
                      Colors.lightGreenAccent[100], Colors.lightGreenAccent[400], Colors.indigo];
final listOfWidths = [96, 72, 48, 36, 24, 18, 12, 6, 24, 24, 24, 24, 24, 24, 24];
final listOfDurations = [16, 12, 8, 6, 4, 3, 2, 1, 4, 4, 4, 4, 4, 4, 4];
final listOfNames = ['whole', 'dotHalf', 'half', 'dotQuarter', 'quarter',
                    'dotEighth', 'eighth', 'sixteenth',
                    'oneEAndA', 'oneAnd', 'oneAndA', 'oneEAnd', 'eAndA', 'oneEA', 'oneA'];
final rhythmArrays = [[16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16], //Whole
                      [12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12], //Dot Half
                      [8, 8, 8, 8, 8, 8, 8, 8], //Half
                      [6, 6, 6, 6, 6, 6], //Dot Quarter
                      [4, 4, 4, 4], //Quarter
                      [3, 3, 3], //Dot Eighth
                      [2, 2], //Eighth
                      [1], //Sixteenth
                      [1, 1, 1, 1], //One E And A
                      [2, 2, 2, 2], //One And
                      [2, 2, 1, 1], //One And A
                      [1, 1, 2, 2], //One E And
                      [0, 1, 1, 1], //E And A
                      [1, 2, 2, 1], //One E A
                      [3, 3, 3, 1]]; //One A
final List<int> measureRhythm = [];
final listOfContainers = [
  for (var j in listOfNames)
    Container(
      width: (listOfWidths[listOfNames.indexOf(j)] * n),
      height: 36 * n,
      decoration: BoxDecoration(
        color: listOfColors[listOfNames.indexOf(j)],
        border: Border.all(
          color: Colors.black,
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Measure Box'),
          ),
          body: Column (
              children: [
                Container (
                    height: 36*n,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i in listOfContainers)
                            Draggable<Color>(
                              child: i,
                              feedback: i,
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
          )
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
          return Center (
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
                      color: Color(0xfff8dc),
                      border: Border.all(
                        color: Colors.white,
                        width: 2*n,
                      ),
                    ),
                    child: MeasureBoxWidget()
                  )
              )
          );
        } else {
          return Center (
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
                child: MeasureBoxWidget()
              )
            )
          );
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
class _MBWidgetState extends State<MeasureBoxWidget> {
  int _maxFull = 16;
  int _howMany = 0;
  @override
  bool successfulDrop;
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      builder: (BuildContext context, List<Color> incoming, List rejected) {
        if (successfulDrop == true) {
          return Center (
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
          );
        } else {
          return null;
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

