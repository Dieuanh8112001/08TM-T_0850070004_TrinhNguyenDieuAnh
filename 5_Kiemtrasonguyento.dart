import 'package:flutter/material.dart';

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
  TextEditingController _numberController = TextEditingController();
  String _resultText = '';

  void _checkPrime() {
    int number = int.tryParse(_numberController.text) ?? 0;

    if (number <= 1) {
      _resultText = '$number không phải số nguyên tố.';
    } else {
      bool isPrime = true;
      for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        _resultText = '$number là số nguyên tố.';
      } else {
        _resultText = '$number không phải số nguyên tố.';
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder( // Để định nghĩa viền khi TextField được focus
                    borderSide: BorderSide(color: Colors.blue),
                )
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkPrime,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 16),
            Text(
              _resultText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
