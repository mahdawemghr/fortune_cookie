import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'fortune teller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var random_fortune = [
    "you are awsome!",
    "Good Luck",
    "Lucky Fucker",
    "Amaizing",
    "Bad Luck",
  ];
  String _currentFortune = "";

  void _randomFortune() {
    var random = Random();
    int randomNum = random.nextInt(random_fortune.length);
    setState(() {
      _currentFortune = random_fortune[randomNum];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/snjop.jpeg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Your fortune is:',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _currentFortune,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _randomFortune,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text("Get Fortune"),
            ),
          ],
        ),
      ),
    );
  }
}
