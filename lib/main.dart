import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final listOfColors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.grey];
final listOfWidths = [96, 72, 48, 36, 24, 24, 24];
final listOfDurations = [16, 12, 8, 6, 4, 4, 4];
final listOfContainers = [whole, dotHalf, half, dotQuarter, quarter, oneEAndA];
var _currentList = [];
int _howFull = 0;


final n = 3.0; // Scale factor for scroll blocks
final whole = Container (
  width: 96*n,
  height: 36*n,
  color: Colors.red,
);

final dotHalf = Container (
  width: 72*n,
  height: 36*n,
  color: Colors.orange,
);
final half = Container (
  width: 48*n,
  height: 36*n,
  color: Colors.yellow,
);
final dotQuarter = Container (
  width: 36*n,
  height: 36*n,
  color: Colors.green,
);
final quarter = Container (
  width: 24*n,
  height: 36*n,
  color: Colors.blue,
);
final oneEAndA = Container (
  width: 24*n,
  height: 36*n,
  color: Colors.purple,
);
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
                )
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
                      color: Colors.black,
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
                  )
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

