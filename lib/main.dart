import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

part 'data.dart';

void main() {
  runApp(MyApp());
}

class Data {
  List<Color> listOfColors;
  List<Color> listOfDarkColors;
  List<int> listOfWidths;
  List<int> listOfDurations;
  List<String> listOfNames;
  List<List<int>> rhythmArrays;
  List<String> labelArray;
  List<double> listOfScales;
  String boxType;
  List<Container> listOfContainers;
  int boxHeight;
  int boxWidth;
  int maxFull;

  Data ({this.listOfColors, this.listOfDarkColors, this.listOfWidths,
    this.listOfDurations, this.listOfNames, this.rhythmArrays,
    this.labelArray, this.listOfScales, this.boxType, this.listOfContainers,
    this.boxHeight, this.boxWidth, this.maxFull});
}

final List<int> boxRhythm = [];
var _currentList = [];
int _howFull = 0;


//final n = 3.0; // Scale factor for scroll blocks

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mehek Box',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: FirstPage(boxData: beatData),
    );
  }
}
class BackgroundWidget extends StatefulWidget {
  @override
  //BackgroundWidget({Key key}) : super(key: key);
  final Data boxData;
  BackgroundWidget({this.boxData});
  _BackgroundWidgetState createState() => _BackgroundWidgetState(boxData: boxData);
  Widget build(BuildContext context) {

  }
}
class _BackgroundWidgetState extends State<BackgroundWidget> {
  final Data boxData;
  _BackgroundWidgetState({this.boxData});
  @override
  bool successfulDrop;
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (BuildContext context, List<int> incoming, List rejected) {
        if (successfulDrop == true) {
          return MeasureBoxWidget(boxData: boxData);
        } else {
          return MeasureBoxWidget(boxData: boxData);
        }
      },

      onAccept: (data) {
        setState(() {
          successfulDrop = true;
          _howFull = _howFull - boxData.listOfDurations[boxData.listOfColors.indexOf(_currentList[data])];
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
  final Data boxData;
  MeasureBoxWidget({this.boxData});
  @override
  //MeasureBoxWidget({Key key}) : super(key: key);
  _MBWidgetState createState() => _MBWidgetState(boxData: boxData);
  Widget build(BuildContext context) {

  }
}


final AudioCache player = new AudioCache(prefix: 'sounds2/');

class _MBWidgetState extends State<MeasureBoxWidget> {
  final Data boxData;
  _MBWidgetState({this.boxData});
  @override
  bool successfulDrop;
  bool isButtonEnabled;
  bool complete = false;
  Function _enableButton() {
    isButtonEnabled = (_howFull == boxData.maxFull);
    if (isButtonEnabled) {
      return () {
        boxRhythm.clear();
        for (var l in _currentList) {
          boxRhythm.addAll(boxData.rhythmArrays[boxData.listOfColors.indexOf(l)]);
        }
        player.clearCache();
        List<String> loadAllArray = [];
        for (int i = 0; i < boxRhythm.length; i++) {
          loadAllArray.add('Index'+ (i + 1).toString() + 'Length' + boxRhythm[i].toString() + '.wav');
          if (boxRhythm[i] != 0) {
            i = i + boxRhythm[i] - 1;
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
                        height: boxData.boxHeight*n,
                        width: boxData.boxWidth*n,
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
                                    child: boxData.listOfContainers[boxData.listOfColors.indexOf(i)],
                                    feedback: Material (
                                      child: boxData.listOfContainers[boxData.listOfColors.indexOf(i)],
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
                            height: boxData.boxHeight*n,
                            width: boxData.boxWidth*n,
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
                                        child: boxData.listOfContainers[boxData.listOfColors.indexOf(i)],
                                        feedback: boxData.listOfContainers[boxData.listOfColors.indexOf(i)],
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

      onWillAccept: (data) => boxData.listOfDurations[boxData.listOfColors.indexOf(data)] + _howFull <= boxData.maxFull,

      onAccept: (data) {
        setState(() {
          successfulDrop = true;
          _howFull = boxData.listOfDurations[boxData.listOfColors.indexOf(data)] + _howFull;
          _currentList.add(data);
        });
      },
      onLeave: (data) {

      },

    );
  }
}



class FirstPage extends StatelessWidget{
  final Data boxData;
  FirstPage({this.boxData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(boxData.boxType+' Box'),
      ),
      body: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container (
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: (boxData.boxHeight - 4)*n,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i in boxData.listOfContainers)
                        Draggable<Color>(
                          child: i,
                          feedback: Material (
                            child: i,
                          ),
                          childWhenDragging: i,
                          data: boxData.listOfColors[(boxData.listOfContainers.indexOf(i))],
                          affinity: Axis.vertical,
                        )
                    ]
                )
            ),
            Expanded(
                child: Container(
                  color: Color(0xffe4e1),
                  child: BackgroundWidget(boxData: boxData),
                )
            ),
          ]// Children
      ),
      drawer: Drawer (
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}