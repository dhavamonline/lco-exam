import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageName1 = "/dice1.png";
  var imageName2 = "/dice1.png";
  imageChange() {
    var r = new Random().nextInt(6) + 1;
    setState(() {
      switch (r.toString()) {
        case "1":
          imageName1 = "/dice1.png";
          break;
        case "2":
          imageName1 = "/dice2.png";
          break;
        case "3":
          imageName1 = "/dice3.png";
          break;
        case "4":
          imageName1 = "/dice4.png";
          break;
        case "5":
          imageName1 = "/dice5.png";
          break;
        case "6":
          imageName1 = "/dice6.png";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                    "assets" + imageName1,
                    height: 150.0,
                    width: 150.0,
                  )),
                ],
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text(
                  "Roll It",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 5.0,
                color: Colors.blue,
                onPressed: imageChange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
