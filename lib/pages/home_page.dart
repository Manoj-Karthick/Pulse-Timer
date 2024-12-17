import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart/modes.dart';

enum _modes { Pomo, ShortBreak, LongBreak }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Map<String, dynamic> _mode = const {
    "Pomo": {
      "name": "Pomorodo",
      "time": "25:00",
    },
    "ShortBreak": {
      "name": "Short Break",
      "time": "5:00",
    },
    "LongBreak": {
      "name": "Long Break",
      "time": "15:00",
    }
  };

  void _handleMode() {}

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
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Modes(_mode["Pomo"]["name"], true),
                      Modes(_mode["ShortBreak"]["name"], false),
                      Modes(_mode["LongBreak"]["name"], false),
                    ],
                  ),
                ),
                Text(
                  _mode["Pomo"]["time"],
                  style: GoogleFonts.varelaRound(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
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
