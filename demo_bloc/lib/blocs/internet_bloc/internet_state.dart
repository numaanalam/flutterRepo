abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}

class CheckEligibilityState extends InternetState {
  final String message;
  CheckEligibilityState(this.message);
}
