import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fortune_cookie/provider/FortunModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Fortunmodel(),
      child: const MyApp(),
    ),
  );
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
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    final fortune = Provider.of<Fortunmodel>(context);
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
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                fortune.currentFortune,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ElevatedButton(
              onPressed: fortune.updateFortune,
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
