import 'package:flutter/material.dart';

class PulseTimer with ChangeNotifier {
  int _remainingTime = 25 * 60; // Default 25 minutes in seconds
  bool _isRunning = false;

  int get remainingTime => _remainingTime;

  bool get isRunning => _isRunning;

  void startTimer() {
    _isRunning = true;
    notifyListeners();
    // Logic to decrease time (use a periodic timer here)
  }

  void pauseTimer() {
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _remainingTime = 25 * 60;
    _isRunning = false;
    notifyListeners();
  }

  void updateTime(int seconds) {
    _remainingTime = seconds;
    notifyListeners();
  }
}
