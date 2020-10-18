part of 'main.dart';

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
                                        data: ([currentListNums[measureNumber - 1].indexOf(i), measureNumber - 1]),
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
                    tooltip: "Play Rhythm",
                  ),
                )
              ]
          );
        },

        onWillAccept: (data) {
          if (data is String) {
            return (boxData.listOfDurations[boxData.listOfNames.indexOf(data)] + howFullNums[measureNumber - 1] <= boxData.maxFull);
          }
          if (data is int) {
            //
          }
          return false;
        },
        onAccept: (data) {
          setState(() {
            isAccessible = false;
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
