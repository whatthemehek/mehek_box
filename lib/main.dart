import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:vibration/vibration.dart';

part 'data.dart';

void main() {
  runApp(MyApp());
}

final List<List<int>> boxRhythmNums = [[], [], [], [],];
final List<List<int>> vibrateRhythmNums = [[250], [250], [250], [250]];


final List<int> howFullNums = [0];

var currentListNums = [[], [], [], []];
var isAccessible = false;




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mehek Box',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/measure',
      routes: {
        '/measure': (context) => FirstPage(boxData: measureData),
        '/beat': (context) => FirstPage(boxData: beatData),
        '/threeFour': (context) => FirstPage(boxData: threeFourData),
        '/privacy': (context) => PrivacyPolicy(),
      },
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


List<bool> successfulDropNums = [null, null, null, null];

class _BackgroundWidgetState extends State<BackgroundWidget> {
  final Data boxData;
  _BackgroundWidgetState({this.boxData});
  @override

  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < howFullNums.length; i++)
            Center (
              child: DragTarget<int>
                (builder: (BuildContext context, List<int> incoming, List rejected) {
                if (successfulDropNums[i] == true) {
                  return MeasureBoxWidget(boxData: boxData, measureNumber: 1 + i);
                } else {
                  return MeasureBoxWidget(boxData: boxData, measureNumber: 1 + i);
                }
              },

                  onAccept: (data) {
                    setState(() {
                      successfulDropNums[i] = true;
                      howFullNums[i] = howFullNums[i] - boxData.listOfDurations[boxData.listOfNames.indexOf(currentListNums[i][data])];
                      currentListNums[i].removeAt(data);
                    });
                  },
                  onLeave: (data) {

                  }),
            )
        ]
    );
  }
}

class MeasureBoxWidget extends StatefulWidget {
  final Data boxData;
  final int measureNumber;
  MeasureBoxWidget({this.boxData, this.measureNumber});
  @override
  //MeasureBoxWidget({Key key}) : super(key: key);
  _MBWidgetState createState() => _MBWidgetState(boxData: boxData, measureNumber: measureNumber);
  Widget build(BuildContext context) {

  }
}


final AudioCache player = new AudioCache(prefix: 'sounds/');

void _vibrate(List<int> vibrateRhythm, List<int> boxRhythm) async {
  if (await Vibration.hasVibrator() && await Vibration.hasCustomVibrationsSupport()) {
    vibrateRhythm.clear();
    int rest = 250;
    for (int i = 0; i < boxRhythm.length; i++) {
      if (boxRhythm[i] != 0) {
        vibrateRhythm.add(rest + 10);
        vibrateRhythm.add(boxRhythm[i]*250 - 10);
        i += boxRhythm[i] - 1;
        rest = 0;
      } else {
        rest += 250;
      }
    }
    Vibration.vibrate(pattern: vibrateRhythm);
  }
}




class _MBWidgetState extends State<MeasureBoxWidget> {
  final Data boxData;
  final int measureNumber;
  _MBWidgetState({this.boxData, this.measureNumber});
  @override
  bool isButtonEnabled;
  Function _enablePlayButton() {
    isButtonEnabled = (howFullNums[measureNumber - 1] == boxData.maxFull);
    if (isButtonEnabled) {
      return () {
        boxRhythmNums[measureNumber - 1].clear();
        for (var l in currentListNums[measureNumber - 1]) {
          boxRhythmNums[measureNumber - 1].addAll(boxData.rhythmArrays[boxData.listOfNames.indexOf(l)]);
        }
        player.clearCache();
        List<String> loadAllArray = [];
        for (int i = 0; i < boxRhythmNums[measureNumber - 1].length; i++) {
          loadAllArray.add('Index'+ (i + 1).toString() + 'Length' + boxRhythmNums[measureNumber - 1][i].toString() + '.wav');
          if (boxRhythmNums[measureNumber - 1][i] != 0) {
            i = i + boxRhythmNums[measureNumber - 1][i] - 1;
          }
        }
        player.load('metronome.wav');
        player.loadAll(loadAllArray);
        player.play('metronome.wav');
        _vibrate(vibrateRhythmNums[measureNumber - 1], boxRhythmNums[measureNumber - 1]);
        for (String j in loadAllArray) {
          player.play(j);
        }
      };
    } else {
      return null;
    }
  }

  Function _removeRhythm(int indexCurrentList, int indexData) {
    return () {
      setState(() {
        isAccessible = true;
        currentListNums[measureNumber - 1].removeAt(indexCurrentList);
        howFullNums[measureNumber - 1] -= boxData.listOfDurations[indexData];
      });
    };
  }

  Widget build(BuildContext context) {
    if (isAccessible) {
      return Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  //Draws the box, with the right size
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Container(
                            height: boxData.boxHeight * n,
                            width: boxData.boxWidth * n,
                            decoration: BoxDecoration(
                              color: Color(0xc9c9c9),
                              border: Border.all(
                                color: Colors.white,
                                width: 2 * n,
                              ),
                            ),
                            // Draws the blocks currently in the box
                            child: Center(
                                child: Row(
                                  children: [
                                    for (int i = 0; i < currentListNums[measureNumber - 1].length; i++)
                                      Container (
                                          width: boxData.listOfWidths[boxData.listOfNames.indexOf(currentListNums[measureNumber - 1][i])]*n,
                                          height:(boxData.boxHeight - 4)*n,
                                          child: RawMaterialButton(
                                            onPressed: _removeRhythm(i, boxData.listOfNames.indexOf(currentListNums[measureNumber - 1][i])),
                                            padding: EdgeInsets.all(0),
                                            child: Tooltip(message: currentListNums[measureNumber - 1][i],
                                                child: boxData.listOfContainers[boxData.listOfNames.indexOf(currentListNums[measureNumber - 1][i])]),
                                          )
                                      )
                                  ],
                                )
                            )
                        )
                    )
                ),
                Container(
                  child: IconButton(
                    iconSize: 80.0,
                    icon: Icon(Icons.play_circle_filled),
                    color: Colors.blue,
                    disabledColor: Colors.grey,
                    onPressed: _enablePlayButton(),
                    tooltip: "Play Rhythm",
                  ),
                )
              ]
          )
      );
    } else {
      return DragTarget<String>(
        builder: (BuildContext context, List<String> incoming, List rejected) {
          return Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center (
                  //Draws the box, with the right size
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
                            // Draws the blocks currently in the box
                            child: Center (
                                child: Row(
                                  children: [
                                    for (var i in currentListNums[measureNumber - 1])
                                      Draggable(
                                        child: boxData.listOfContainers[boxData.listOfNames.indexOf(i)],
                                        feedback: Material (
                                          child: boxData.listOfContainers[boxData.listOfNames.indexOf(i)],
                                        ),
                                        childWhenDragging: null,
                                        data: (currentListNums[measureNumber - 1].indexOf(i)),
                                      ),
                                  ],
                                )
                            )
                        )
                    )
                ),
                Container(
                  child: IconButton (
                    iconSize: 80.0,
                    icon: Icon(Icons.play_circle_filled),
                    color: Colors.blue,
                    disabledColor: Colors.grey,
                    onPressed: _enablePlayButton(),
                    tooltip: "Kansas",
                  ),
                )
              ]
          );
        },

        onWillAccept: (data) => boxData.listOfDurations[boxData.listOfNames.indexOf(data)] + howFullNums[measureNumber - 1] <= boxData.maxFull,

        onAccept: (data) {
          setState(() {
            isAccessible = false;
            print(data);
            print(boxData.listOfNames.indexOf(data));
            print(boxData.listOfDurations[boxData.listOfNames.indexOf(data)]);
            howFullNums[measureNumber - 1] = boxData.listOfDurations[boxData.listOfNames.indexOf(data)] + howFullNums[measureNumber - 1];
            currentListNums[measureNumber - 1].add(data);
          });
        },
        onLeave: (data) {

        },

      );
    }
  }
}

//Compose Page

class _FirstPageWidgetState extends State<FirstPage> {
  final Data boxData;
  _FirstPageWidgetState({this.boxData});
  @override
  Widget build(BuildContext context) {
    Function _addRhythm(int index, Data boxData, int measureNumber) {
      return () {
        setState(() {
          isAccessible = true;
          if (boxData.listOfDurations[index] + howFullNums[measureNumber - 1] <= boxData.maxFull) {
            currentListNums[measureNumber - 1].add(boxData.listOfNames[index]);
            howFullNums[measureNumber - 1] += boxData.listOfDurations[index];
          }
        });
      };
    }
    Function _enableAddMeasure() {
      bool isButtonEnabled = (howFullNums.length < 4) && !isAccessible;
      if (isButtonEnabled) {
        return () {
          setState(() {
            howFullNums.add(0);
          });
        };
      }
    }
    Function _enableRemoveMeasure() {
      bool isButtonEnabled = (howFullNums.length > 1) && !isAccessible;
      if (isButtonEnabled) {
        return () {
          setState(() {
            howFullNums.removeAt(howFullNums.length - 1);
          });
        };
      }
    }
    if (isAccessible) {
      return Scaffold(
        appBar: AppBar(
          title: Text(boxData.boxType + "Box"),
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
                        for (var index in boxData.listOfContainers)
                          Container (
                            width: boxData.listOfWidths[boxData.listOfContainers.indexOf(index)]*n,
                            height:(boxData.boxHeight - 4)*n,
                            child: RawMaterialButton(
                              padding: EdgeInsets.all(0),
                              onPressed: _addRhythm(boxData.listOfContainers.indexOf(index), boxData, 1),
                              child: Tooltip(message: boxData.listOfNames[boxData.listOfContainers.indexOf(index)],
                                  child: index),
                            ),
                          )
                      ]
                  )
              ),
              Expanded(
                  child: Container(
                    color: Color(0xffe4e1),
                    child: MeasureBoxWidget(boxData: boxData, measureNumber: 1),
                  )
              ),
            ]// Children
        ),
        drawer: Drawer (
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Measure Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/measure');
                },
              ),
              ListTile(
                title: Text('Beat Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/beat');
                },
              ),
              ListTile(
                title: Text('3/4 Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/threeFour');
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.pushNamed(context, '/privacy');
                },
              ),
              SwitchListTile(
                title: Text('Screen-reader Optimized'),
                value: isAccessible,
                onChanged: (bool value) {
                  setState(() {
                    isAccessible = value;
                  });
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(boxData.boxType + " Box"),
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
                        for (var index in boxData.listOfContainers)
                          Draggable<String>(
                            child: index,
                            feedback: Material(
                              child: index,
                            ),
                            childWhenDragging: index,
                            data: boxData.listOfNames[boxData.listOfContainers.indexOf(index)],
                            affinity: Axis.vertical,
                          )
                      ]
                  )
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 80.0,
                      icon: Icon(Icons.add_circle_sharp),
                      color: Colors.red,
                      disabledColor: Colors.grey,
                      onPressed: _enableAddMeasure(),
                      tooltip: "Add Measure",
                    ),
                    IconButton(
                      iconSize: 80.0,
                      icon: Icon(Icons.remove_circle),
                      color: Colors.red,
                      disabledColor: Colors.grey,
                      onPressed: _enableRemoveMeasure(),
                      tooltip: "Remove Measure",
                    ),
                  ]
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
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Measure Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/measure');
                },
              ),
              ListTile(
                title: Text('Beat Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/beat');
                },
              ),
              ListTile(
                title: Text('3/4 Box'),
                onTap: () {
                  Navigator.pushNamed(context, '/threeFour');
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.pushNamed(context, '/privacy');
                },
              ),
              SwitchListTile(
                title: Text('Screen-reader Optimized'),
                value: isAccessible,
                onChanged: (bool value) {
                  setState(() {
                    isAccessible = value;
                  });
                },
              )
            ],
          ),
        ),
      );
    }
  }
}

class FirstPage extends StatefulWidget{
  final Data boxData;
  FirstPage({this.boxData});
  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState(boxData: boxData);
  Widget build(BuildContext context) {


  }
}
class PrivacyPolicy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Text(
          'At the present (7/21/20), the Mehek Box app and webapp do not intake any user data, in any form.'
      ),
      drawer: Drawer (
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Measure Box'),
              onTap: () {
                Navigator.pushNamed(context, '/measure');
              },
            ),
            ListTile(
              title: Text('Beat Box'),
              onTap: () {
                Navigator.pushNamed(context, '/beat');
              },
            ),
            ListTile(
              title: Text('3/4 Box'),
              onTap: () {
                Navigator.pushNamed(context, '/threeFour');
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.pushNamed(context, '/privacy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
