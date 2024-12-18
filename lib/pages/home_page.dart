import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart/modes.dart';

enum modes { Pomo, ShortBreak, LongBreak }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Mode {
  final String key;
  final String name;
  final int time; // time in minutes

  const Mode({
    required this.key,
    required this.name,
    required this.time,
  });
}

class _HomePageState extends State<HomePage> {
  static const Map<String, dynamic> _mode = const {
    "Pomo": Mode(
      key: "Pomo",
      name: "Pomodoro",
      time: 25,
    ),
    "ShortBreak": Mode(
      key: "ShortBreak",
      name: "Short Break",
      time: 5,
    ),
    "LongBreak": Mode(
      key: "LongBreak",
      name: "Long Break",
      time: 15,
    ),
  };

  String activeMode = "Pomo";

  // Timer duration in seconds (25 minutes)
  int _remainingSeconds = _mode[modes.Pomo.name].time * 60;

  // Display time string
  String get _timeString {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  Timer? _timer; // Timer instance
  bool _isRunning = false;
  bool _isPaused = false;

  void _startTimer() {
    if (_isRunning && _isPaused) {
      _resumeTimer();
    } else {
      setState(() {
        _isRunning = true;
        _isPaused = false;
      });
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  // Pause the Timer
  void _pauseTimer() {
    if (_timer != null) {
      setState(() {
        _isPaused = true;
        _isRunning = false;
      });
      _timer!.cancel();
    }
  }

  // Resume the Timer
  void _resumeTimer() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  // Reset the Timer
  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _remainingSeconds = _mode[activeMode].time * 60;
      _isRunning = false;
      _isPaused = false;
    });
  }

  // Stop Timer
  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
    });
  }

  void _handleMode(Mode mode) {
    setState(() {
      this.activeMode = mode.key;
      _resetTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Clean up timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            width: 400,
            height: 330,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.tertiary, // Shadow color
                  offset: Offset(2, 2), // Shadow position (X, Y)
                  blurRadius: 4, // How much the shadow should spread
                  spreadRadius: 1, // Spread of the shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Modes(
                        _mode[modes.Pomo.name],
                        activeMode == modes.Pomo.name,
                        _handleMode,
                      ),
                      Modes(
                        _mode[modes.ShortBreak.name],
                        activeMode == modes.ShortBreak.name,
                        _handleMode,
                      ),
                      Modes(
                        _mode[modes.LongBreak.name],
                        activeMode == modes.LongBreak.name,
                        _handleMode,
                      ),
                    ],
                  ),
                ),
                Text(
                  _timeString,
                  style: GoogleFonts.varelaRound(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                (_isRunning || _isPaused)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _isPaused ? _resumeTimer : _pauseTimer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onSurface,
                              foregroundColor: Colors.white,
                              // Text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 2),
                              // Button size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Adjust border radius here
                              ),
                              elevation: 2,
                            ), // Button shadow),
                            child: Text(
                              _isPaused ? 'RESUME' : 'PAUSE',
                              style: GoogleFonts.dongle(
                                fontSize: 40,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: _resetTimer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              // Button size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Adjust border radius here
                              ),
                              elevation: 2,
                            ), // Button shadow),
                            child: Icon(
                              Icons.restart_alt,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ],
                      )
                    : ElevatedButton(
                        onPressed: _startTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                          foregroundColor: Colors.white,
                          // Text color
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                          // Button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Adjust border radius here
                          ),
                          elevation: 2,
                        ), // Button shadow),
                        child: Text(
                          'START',
                          style: GoogleFonts.dongle(
                            fontSize: 40,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
