import 'package:flutter/material.dart';

class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    'Congratulations on completing the quiz! You can reset it below.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  print("reset pressed!");
                },
                child: Container(
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text(
                      'RESET Quiz',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
