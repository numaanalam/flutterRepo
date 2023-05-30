// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:demo_app/screen3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var nameController = TextEditingController();

  static const String KEYNAME = "name";
  var nameValue = "No Saved Value";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pic2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Local Storage'),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Enter Value',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();

                          prefs.setString(
                              KEYNAME, nameController.text.toString());
                          getValue();
                          cleartext();
                        },
                        child: Text('Save')),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      nameValue,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(KEYNAME);

    nameValue = getName != null ? getName : "No Saved Value";

    setState(() {});
  }

  void cleartext() {
    nameController.clear();
  }
}
