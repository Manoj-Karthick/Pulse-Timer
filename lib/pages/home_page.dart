import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/providers/pulse_timer.dart';
import 'package:provider/provider.dart';

import '../constants/Modes.dart';
import '../widgets.dart/modes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<PulseTimer>(context);

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
                  offset: Offset(1, 0.5), // Shadow position (X, Y)
                  blurRadius: 2, // How much the shadow should spread
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
                        timer.mode[modes.ShortBreak.name],
                        timer.activeMode == modes.ShortBreak.name,
                        timer.handleMode,
                      ),
                      Modes(
                        timer.mode[modes.Focus.name],
                        timer.activeMode == modes.Focus.name,
                        timer.handleMode,
                      ),
                      Modes(
                        timer.mode[modes.LongBreak.name],
                        timer.activeMode == modes.LongBreak.name,
                        timer.handleMode,
                      ),
                    ],
                  ),
                ),
                Text(
                  timer.timeString,
                  style: GoogleFonts.varelaRound(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                (timer.isRunning || timer.isPaused)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: timer.isRunning
                                ? timer.pauseTimer
                                : timer.resumeTimer,
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
                              timer.isPaused ? 'RESUME' : 'PAUSE',
                              style: GoogleFonts.dongle(
                                fontSize: 40,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: timer.resetTimer,
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
                        onPressed: timer.startTimer,
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
