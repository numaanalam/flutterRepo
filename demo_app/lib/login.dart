// ignore_for_file: prefer_const_constructors

import 'package:demo_app/screen1.dart';
import 'package:flutter/material.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  TextEditingController _email = new TextEditingController();

  var pswd = TextEditingController();
  var isInvalidCredentials = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pic1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, top: 120),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 30,
                    left: 30),
                child: Column(
                  children: [
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: pswd,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    if (isInvalidCredentials)
                      Text(
                        "INVALID CREDENTIALS!",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade800,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              String pSWD = pswd.text.toString();

                              if (pSWD == '123') {
                                setState(() {
                                  isInvalidCredentials = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        FirstScreen(email: _email.text)));
                              } else {
                                setState(() {
                                  isInvalidCredentials = true;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
