import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:les5routesquizappexample/Library.dart';
import 'EndScreen.dart';

QuestionBank bank = QuestionBank();
AudioCache player = AudioCache();

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
        /*
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
        //);*/
        player.play('DrumRoll.mp3');
        //het duurt even voor de drumRoll geladen is de eerste keren in de emulator,
        // je kan meerdere malen proberen, indien je de eerste keer geen geluid hoort
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EndScreen();
          }),
        );
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
                    child: Center(
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
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
                    child: Center(
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
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
