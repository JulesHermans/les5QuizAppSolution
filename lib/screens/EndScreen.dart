import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
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
              child: FlatButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Text(
                  'RESET Quiz',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  print('Reset pressed');
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
