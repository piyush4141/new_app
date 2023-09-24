import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Number Buttons'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back to the main page
              },
            ),
          ],
        ),
        body: NumberButtonGrid(),
      ),
    );
  }
}

class NumberButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Adjust the number of buttons per row as needed
      ),
      itemCount: 10, // 0 to 9
      itemBuilder: (context, index) {
        final number = '$index';
        return GestureDetector(
          onTap: () {
            // Navigate to the corresponding page when a number button is pressed
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NumberPage(number: number),
              ),
            );
          },
          child: CustomButton(
            label: number,
            color: Colors.blue, // You can customize the color
            fontSize: 70.0,
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;

  CustomButton(
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

class NumberPage extends StatelessWidget {
  final String number;

  NumberPage({required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Page: $number'),
      ),
      body: Center(
        child: Text(
          'This is the page for number $number',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
