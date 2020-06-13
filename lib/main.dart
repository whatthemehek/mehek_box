import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

final n = 3.0; // Scale factor for scroll blocks
final whole = Container (
  width: 96*n,
  color: Colors.red,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measure Box',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measure Box'),
        ),
        body: Column (
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 36*n,
              child: Draggable<Color> ( // Whole
                data: Colors.red,
                child: whole,
                feedback: whole,
                childWhenDragging: whole,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Draggable<Color> ( // Whole
                    data: Colors.red,
                    child: whole,
                    feedback: whole,
                    childWhenDragging: whole,
                  ),
                  Container( // Dot Half
                    width: 72*n,
                    color: Colors.orange,
                  ),
                  Container( // Half
                    width: 48*n,
                    color: Colors.yellow,
                    height: 36*n,
                  ),
                  Container( // Dot Quarter
                    width: 36*n,
                    color: Colors.green,
                    height: 36*n,
                  ),
                  Container( // Quarter
                    width: 24*n,
                    color: Colors.blue,
                    height: 36*n,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container (
                color: Colors.grey,
                child: Center (
                  child: MeasureBox()
                )
              )
            )
          ],// Children
        ),
      ),
    );
  }
}

class MeasureBox extends StatefulWidget {
  @override
  _MeasureBoxState createState() => _MeasureBoxState();
}
class _MeasureBoxState extends State<MeasureBox> {
  int _howFull = 0;
  int _capacity = 16;
  @override
  Widget build(BuildContext context) {
    DragTarget<Color>(
      onWillAccept: (value) => true,
      onAccept: (value) {

      },
      onLeave: (value) {

      },
    );
    return Container(
      width: 100*n,
      height: 40*n,
      color: Colors.white,
    );
  }
}
