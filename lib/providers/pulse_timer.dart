import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../constants/Modes.dart';
import '../models/Mode.dart';

class PulseTimer with ChangeNotifier {
  static const Map<String, dynamic> _mode = const {
    "ShortBreak": Mode(
      key: "ShortBreak",
      name: "Short Break",
      time: 5,
    ),
    "Focus": Mode(
      key: "Focus",
      name: "Focus",
      time: 25,
    ),
    "LongBreak": Mode(
      key: "LongBreak",
      name: "Long Break",
      time: 15,
    ),
  };

  Map<String, dynamic> get mode {
    return _mode;
  }

  String activeMode = "Focus";

  int _remainingSeconds = _mode[modes.Focus.name].time * 60;

  int _remainingTime =
      _mode[modes.Focus.name].time * 60; // Default 25 minutes in seconds

  bool _isRunning = false;
  bool _isPaused = false;

  int get remainingTime => _remainingTime;

  bool get isRunning => _isRunning;

  bool get isPaused => _isPaused;

  String get timeString {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  Timer? _timer;

  void startTimer() {
    if (_isRunning && _isPaused) {
      resumeTimer();
    } else {
      _isRunning = true;
      _isPaused = false;
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        stopTimer();
        notifyListeners();
      }
    });
  }

  void pauseTimer() {
    if (_timer != null) {
      _isRunning = false;
      _isPaused = true;
      _timer?.cancel();
      notifyListeners();
    }
  }

  void updateTime(int seconds) {
    _remainingTime = seconds;
    notifyListeners();
  }

  // Resume the Timer
  void resumeTimer() {
    _isRunning = true;
    _isPaused = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    cancelTimer();
    _isRunning = false;
    _isPaused = false;
    notifyListeners();
  }

  void handleMode(Mode mode) {
    this.activeMode = mode.key;
    resetTimer();
  }

  // Reset the Timer
  void resetTimer() {
    _timer?.cancel();
    _remainingSeconds = _mode[activeMode].time * 60;
    _isRunning = false;
    _isPaused = false;
    notifyListeners();
  }

  void playStartSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource(
        'assets/sounds/timer_start.mp3')); // Plays the sound from assets
  }

  void playStopSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource(
        'assets/sounds/timer_stop.mp3')); // Plays the sound from assets
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    cancelTimer(); // Cancel the timer
    super.dispose();
  }
}
