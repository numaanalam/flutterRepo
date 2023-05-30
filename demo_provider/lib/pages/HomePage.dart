// ignore_for_file: prefer_const_constructors

import 'package:demo_provider/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management (Provider)'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
              child: Consumer<HomePageProvider>(
                  builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Check your Eligibility",
                        style: TextStyle(
                          fontSize: 30,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      provider.eligibilityMessage.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    TextField(
                      style: TextStyle(fontSize: 30),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Age',
                      ),
                      onChanged: (val) {
                        if (val != null && val != "") {
                          provider.checkEligibility(val);
                        } else {}
                      },
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}
