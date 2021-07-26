import 'package:fancy_death/fancy_death.dart';
import 'package:flutter/material.dart';

void main() {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => FancyDeath.fancyDeath(details);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //this text is empty so when we use it to get first index will crash
  String someText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(someText[0]),
        ),
      ),
    );
  }
}
