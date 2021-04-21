import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  final ImagePicker picker = ImagePicker();

  File image;

  void getAndAddImage() async {
    PickedFile pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedFile.path);
    });
  }

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
                  child: image != null
                      ? Image.file(image)
                      : Text(
                          'Congratulations on completing the quiz! You can reset it below.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                )),
            image != null
                ? Container()
                : Expanded(
                    child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getAndAddImage();
                      },
                      child: Container(
                        color: Colors.deepOrange,
                        child: Center(
                          child: Text(
                            'TAKE victory picture',
                            style: TextStyle(fontSize: 25,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap:() {
                Navigator.pop(context);
                },
                child: Container(
                  color: Colors.deepOrange,
                  child: Text(
                    'RESET Quiz',
                    style: TextStyle(fontSize: 25,color: Colors.white),
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
