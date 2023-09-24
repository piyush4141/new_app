import 'package:flutter/material.dart';
import 'alphabet_draw.dart';
import 'test.dart';
import 'backbutton.dart';
import 'numbers.dart';

void main() {
  runApp(MaterialApp(
    home: IntroPage(), // Show IntroPage initially
  ));
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyButtonGrid(),
                  ),
                );
              },
              child: Text('Continue to Main Page'),
            ),
            SizedBox(height: 20.0),
            Text('Select an option:'),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyButtonGrid()));
                    // Handle the first button action here
                  },
                  child: Text('A-Z'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NumberButtonGrid(),
                      ),
                    );
                  },
                  child: Text('0-9'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle the third button action here
                  },
                  child: Text('Option 3'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle the fourth button action here
                  },
                  child: Text('Option 4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
