import 'dart:math';
import 'package:flutter/material.dart';

class Fortunmodel extends ChangeNotifier {
  final randomFortune = [
    "you are awsome!",
    "Good Luck",
    "Lucky Fucker",
    "Amaizing",
    "Bad Luck",
  ];

  String _currentFortune = "";

  String get currentFortune => _currentFortune;

  void updateFortune() {
    _currentFortune = getRandomFortun(randomFortune);
    notifyListeners();
  }

  String getRandomFortun(List<String> randomFortune) {
    var random = Random();
    int randomNum = random.nextInt(randomFortune.length);

    return randomFortune[randomNum];
  }
}
