import 'package:flutter/material.dart';

class AlphabetPage extends StatefulWidget {
  final String letter;

  AlphabetPage({required this.letter});

  @override
  _AlphabetPageState createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  bool isDrawing = false;
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.letter} Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the page for letter ${widget.letter}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final localPosition =
                      renderBox.globalToLocal(details.globalPosition);
                  points.add(localPosition);
                });
              },
              onPanStart: (details) {
                setState(() {
                  isDrawing = true;
                });
              },
              onPanEnd: (details) {
                setState(() {
                  isDrawing = false;
                  points.add(Offset(-1,
                      -1)); // Add a special value to separate drawing segments
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2.0),
                ),
                child: CustomPaint(
                  painter: MyPainter(points: points),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the main page
                Navigator.of(context).pop();
              },
              child: Text('Return to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Offset> points;

  MyPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset(-1, -1) && points[i + 1] != Offset(-1, -1)) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
