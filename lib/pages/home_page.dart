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

class _HomePageState extends State<HomePage> {
  final Map<String, dynamic> _mode = const {
    "Pomo": {
      "key": "Pomo",
      "name": "Pomorodo",
      "time": 25,
    },
    "ShortBreak": {
      "key": "ShortBreak",
      "name": "Short Break",
      "time": 5,
    },
    "LongBreak": {
      "key": "LongBreak",
      "name": "Long Break",
      "time": 15,
    }
  };

  String activeMode = "Pomo";

  // Timer duration in seconds (25 minutes)
  int _totalSeconds = 1 * 60;

  // Display time string
  String get _timeString {
    int minutes = _totalSeconds ~/ 60;
    int seconds = _totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  Timer? _timer; // Timer instance

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSeconds > 0) {
          _totalSeconds--;
        } else {
          timer.cancel(); // Stop timer when it reaches 0
        }
      });
    });
  }

  void _handleMode(String modeName) {
    setState(() {
      this.activeMode = modeName;
      print(this.activeMode);
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
                ElevatedButton(
                  onPressed: _startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    foregroundColor: Colors.white,
                    // Text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                    // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Adjust border radius here
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
