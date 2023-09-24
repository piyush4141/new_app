import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyButtonGrid(),
    );
  }
}

class MyButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Drawing'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          final letter = String.fromCharCode(65 + index);
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DrawingPage(letter: letter),
                ),
              );
            },
            child: SquareButton(
              label: letter,
              color: Color(0xFF000000 + index * 10000),
              fontSize: 24.0,
            ),
          );
        },
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;

  SquareButton(
      {required this.label, required this.color, this.fontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DrawingPage extends StatefulWidget {
  final String letter;

  DrawingPage({required this.letter});

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.letter} Page'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          points.add(null); // Indicates the end of a drawing segment
        },
        child: CustomPaint(
          painter: DrawingPainter(points),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            points.clear();
          });
        },
        child: Icon(Icons.clear),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  List<Offset?> points;
  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        // Draw dots for touch points
        canvas.drawCircle(points[i]!, 2.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
