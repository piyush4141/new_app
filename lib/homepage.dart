import 'package:flutter/material.dart';
import 'alphabet_draw.dart';
import 'test.dart';
import 'backbutton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' AppBar'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back to the main page
              },
            ),
          ],
        ),
        body: MyButtonGrid(),
      ),
    );
  }
}

class MyButtonGrid extends StatelessWidget {
  // Define a Map to associate each letter with its respective page
  final Map<String, Widget Function()> alphabetPages = {
    'A': () => AlphabetPage(letter: 'A'),
    'B': () => AlphabetPage(letter: 'B'),
    'C': () => AlphabetPage(letter: 'C'),
    'D': () => AlphabetPage(letter: 'D'),
    'E': () => AlphabetPage(letter: 'E'),
    'F': () => AlphabetPage(letter: 'F'),
    'G': () => AlphabetPage(letter: 'G'),
    'H': () => AlphabetPage(letter: 'H'),
    'I': () => AlphabetPage(letter: 'I'),
    'J': () => AlphabetPage(letter: 'J'),
    'K': () => AlphabetPage(letter: 'K'),
    'L': () => AlphabetPage(letter: 'L'),
    'M': () => AlphabetPage(letter: 'M'),
    'N': () => AlphabetPage(letter: 'N'),
    'O': () => AlphabetPage(letter: 'O'),
    'P': () => AlphabetPage(letter: 'P'),
    'Q': () => AlphabetPage(letter: 'Q'),
    'R': () => AlphabetPage(letter: 'R'),
    'S': () => AlphabetPage(letter: 'S'),
    'T': () => AlphabetPage(letter: 'T'),
    'U': () => AlphabetPage(letter: 'U'),
    'V': () => AlphabetPage(letter: 'V'),
    'W': () => AlphabetPage(letter: 'W'),
    'X': () => AlphabetPage(letter: 'X'),
    'Y': () => AlphabetPage(letter: 'Y'),
    'Z': () => AlphabetPage(letter: 'Z'),

    // Add more entries for the rest of the alphabet
  };

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Adjust the number of buttons per row as needed
      ),
      itemCount: 26,
      itemBuilder: (context, index) {
        final letter = String.fromCharCode(65 + index);
        return GestureDetector(
          onTap: () {
            // Navigate to the corresponding page when a letter button is pressed
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    alphabetPages[letter]?.call() ?? Container(),
              ),
            );
          },
          child: SquareButton(
            label: letter,
            color: Color(0xFF000000 + index * 10000),
            fontSize: 70.0,
          ),
        );
      },
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
