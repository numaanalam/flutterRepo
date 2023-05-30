// import 'dart:js';
// import 'package:http/http.dart' as http;

import 'package:demo_app/login.dart';
import 'package:demo_app/screen1.dart';
import 'package:demo_app/screen2.dart';
import 'package:demo_app/screen3.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Mylogin(),
      'screen1': (context) => FirstScreen(
            email: '',
          ),
      'screen2': (context) => SecondScreen(),
      'screen3': (context) => ThirdScreen()
    },
  ));
}
