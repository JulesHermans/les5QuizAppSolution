import 'package:flutter/material.dart';
import 'package:les5routesquizappexample/screens/EndScreen.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
