import 'package:flutter/material.dart';

// ignore: prefer_const_constructorsvoid main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hot reload works!!')),
      ),
    );
  }
}
