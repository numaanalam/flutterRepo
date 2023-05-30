// ignore_for_file: prefer_const_constructors

import 'package:demo_bloc/blocs/internet_bloc/internet_bloc.dart';
import 'package:demo_bloc/blocs/internet_bloc/internet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController ageValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer(
    //   listener: listener,
    // builder: builder,)

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('BLOC'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Center(
            child: ListView(children: [
              BlocConsumer<InternetBloc, InternetState>(
                listener: (context, state) {
                  // TODO: implement listener

                  if (state is InternetGainedState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Internet Connected'),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state is InternetLostState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Internet Disconnected'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is InternetGainedState) {
                    return Text("Connected!");
                  } else if (state is InternetLostState) {
                    return Text('Disconnected!');
                  } else {
                    return Text('loading.. ');
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<InternetBloc, InternetState>(
                builder: (context, state) {
                  if (state is CheckEligibilityState) {
                    return Text(
                      state.message,
                      style: TextStyle(color: Colors.blue, fontSize: 25),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              TextField(
                controller: ageValue,
                onChanged: (val) {
                  BlocProvider.of<InternetBloc>(context)
                      .add(CheckEligibilityEvent(ageValue.text));
                },
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Your Age',
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
