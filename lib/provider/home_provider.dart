import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kgbn_task/main.dart';

class HomeProvider extends ChangeNotifier {
  final Random random = Random();
  DateTime currentDateTime = DateTime.now();
  var currentSeconds;
  String timeString = "";
  int successCounter = 0;

  var displayNumber;

  displayRandomNumber() {
    displayNumber = random.nextInt(60);
    currentSeconds = currentDateTime.second;
    print(currentSeconds);
    if (displayNumber.toInt == currentSeconds.toInt) {
      print("both are same");
      timeString = "Success";
      checkSuccessMessge();
    } else {
      timeString = " Sorry please Try again";
    }

    notifyListeners();
  }

  checkSuccessMessge() async {
    final int counter = prefs.getInt('successCounter') ?? 0;
    successCounter = counter + 1;
    await prefs.setInt("successCounter", successCounter);
    notifyListeners();
  }
}
