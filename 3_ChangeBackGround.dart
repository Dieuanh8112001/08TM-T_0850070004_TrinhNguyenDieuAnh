import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    // Add more colors here if needed
  ];

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Color _getRandomColor() {
    Random random = Random();
    int index = random.nextInt(colors.length);
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _incrementCounter();
          },
          child: Text('Tap Me!'),
        ),
      ),
      backgroundColor: counter % 2 == 0 ? _getRandomColor() : Colors.white,
    );
  }
}