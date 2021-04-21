import 'package:flutter/material.dart';
import 'package:les5routesquizappexample/Library.dart';
import 'EndScreen.dart';

QuestionBank bank = QuestionBank();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> scoreKeeper = [];

  void _checkAnswer(bool userAnswer) {
    bool correctAnswer = bank.getCurrentAnswer();
    setState(() {
      if (bank.isFinished()) {
        //this is the solution for showing the dialog
        //showDialog(
        //  context: context,
        //  barrierDismissible: true,
        //  child: AlertDialog(
        //    title: Center(
        //        child: Text('Finished, you reached the end of the quiz!')),
        //    shape: RoundedRectangleBorder(
        //      borderRadius: BorderRadius.circular(10),
        //    ),
        //  ),
        //);
        bank.reset();
        scoreKeeper = [];
      } else {
        if (userAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.clear, color: Colors.red));
        }
        bank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  bank.getCurrentQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _checkAnswer(true);
                  },
                  child: Container(
                    color: Colors.green,
                    child: Text(
                      'TRUE',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _checkAnswer(false);
                  },
                  child: Container(
                    color: Colors.red,
                    child: Text(
                      'FALSE',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
