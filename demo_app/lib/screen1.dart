// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:demo_app/screen2.dart';
import 'package:demo_app/screen3.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  String email;

  FirstScreen({required this.email});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/pic2.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Welcome'),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.30,
                    right: MediaQuery.of(context).size.width * 0.30,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/pic3.jpg'),
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SecondScreen()));
                          },
                          child: Text('Local Storage')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ThirdScreen()));
                          },
                          child: Text('Wallpaper'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
