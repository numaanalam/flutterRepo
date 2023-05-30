import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool isEligible = true;
  String eligibilityMessage = "";

  void checkEligibility(String age) {
    try {
      final newAge = double.parse(age);
      if (newAge >= 18 && newAge <= 100) {
        isEligible = true;
        eligibilityMessage = 'You are Eligible';
        notifyListeners();
      } else {
        isEligible = false;
        eligibilityMessage = 'You are not Eligible';
        notifyListeners();
      }
    } catch (FormatException) {
      isEligible = false;
      eligibilityMessage = 'Invalid age';
      notifyListeners();
    }
  }
}
