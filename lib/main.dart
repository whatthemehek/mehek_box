import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
                          Draggable<Color> (
                            data: Colors.red,
                            child: whole,
                            feedback: whole,
                            childWhenDragging: whole,
                            affinity: Axis.vertical,
                          ),
                          Draggable<Color> (
                            data: Colors.orange,
                            child: dotHalf,
                            feedback: dotHalf,
                            childWhenDragging: dotHalf,
                            affinity: Axis.vertical,
                          ),
                          Draggable<Color> (
                            data: Colors.yellow,
                            child: half,
                            feedback: half,
                            childWhenDragging: half,
                            affinity: Axis.vertical,
                          ),
                          Draggable<Color> (
                            data: Colors.green,
                            child: dotQuarter,
                            feedback: dotQuarter,
                            childWhenDragging: dotQuarter,
                            affinity: Axis.vertical,
                          ),
                          Draggable<Color> (
                            data: Colors.blue,
                            child: quarter,
                            feedback: quarter,
                            childWhenDragging: quarter,
                            affinity: Axis.vertical,
                          ),
                        ]
                    )
                ),
                Expanded (
                  child: Container (
                    color: Colors.grey,
                    child: Center (
                      child: MeasureBoxWidget()
                    )
                  )
                )
              ] // Children
          )
      ),
    );
  }
}

class MeasureBoxWidget extends StatefulWidget {
  @override
  MeasureBoxWidget({Key key}) : super(key: key);
  _MBWidgetState createState() => _MBWidgetState();

}
class _MBWidgetState extends State<MeasureBoxWidget> {
  int _howFull = 0;
  int _maxFull = 16;
  @override
  bool successfulDrop;
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      builder: (BuildContext context, List<Color> incoming, List rejected) {
        if (successfulDrop == true) {
          return whole;
        } else {
          return half;
        }
      },
    );
  }
}