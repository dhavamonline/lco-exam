import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var inputController = TextEditingController();
  var outputController = TextEditingController();
  final String url = "https://blockchain.info/tobtc?currency=INR&value=500";
  var data;
  var warning = "";

  onButtonPressed() {
    if (inputController.text == "") {
      warning = "Please enter value";
    }
    setState(() {
      var number = double.tryParse(inputController.text);
      outputController.text = (number * data).toString();
    });
  }

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    var responce = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdatatojson = json.decode(responce.body);
      data = convertdatatojson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bitcoin Price"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100.0, right: 25.0, left: 25.0),
                child: TextField(
                  controller: inputController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.monetization_on,
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    hintText: "Enter Amount in INR",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, right: 25.0, left: 25.0),
                child: TextField(
                  controller: outputController,
                  enabled: false,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.compare_arrows,
                      color: Colors.amber,
                    ),
                    hintText: "Converted Amount",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: MaterialButton(
                  minWidth: 310,
                  height: 50,
                  onPressed: () {
                    onButtonPressed();
                  },
                  child: Text("Convert"),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ));
  }
}
