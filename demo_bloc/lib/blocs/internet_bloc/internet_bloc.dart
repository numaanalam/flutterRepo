import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:demo_bloc/blocs/internet_bloc/internet_event.dart';
import 'package:demo_bloc/blocs/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitialState()) {
    Connectivity _connectivity = Connectivity();
    StreamSubscription? connectivitySubstription;

    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    on<CheckEligibilityEvent>((event, emit) {
      try {
        if (int.parse(event.age) >= 18 && int.parse(event.age) <= 100) {
          emit(CheckEligibilityState("Eligible"));
        } else if (int.parse(event.age) >= 1 && int.parse(event.age) <= 17) {
          emit(CheckEligibilityState("Not Eligible"));
        }
      } catch (FormatException) {
        emit(CheckEligibilityState("Invalid Input"));
      }
    });

    connectivitySubstription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });

    //Adding extra methods to just for Testing purposes

    @override
    Future<void> close() {
      connectivitySubstription?.cancel();
      return super.close();
    }
  }
//For Testing Purposes
  int xyz(int i, int j) {
    return i + j;
  }

  int pqr(int i, int j) {
    return i * j;
  }
}
