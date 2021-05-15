import 'package:exo1/TextControl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var text = "Welcome to my app";

  void change() {
    setState(() {
      text = "I am gonna see";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(children: [Text(text), TextControl(change)]),
    ));
  }
}
