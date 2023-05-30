import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: const <Widget>[
              CircleAvatar(),
              Text('This is new Flutter '),
              Text('Made by Me'),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.indigo,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
