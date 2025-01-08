import 'package:flutter/material.dart';
import 'package:learn_flutter/timer/view/timer_page.dart';
import 'package:learn_flutter/timer_mode/timer_mode.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  offset: Offset(1, 0.5), // Shadow position (X, Y)
                  blurRadius: 2, // How much the shadow should spread
                ),
              ],
            ),
            child: Column(
              children: [
                TimerModePage(),
                SizedBox(height: 30),
                TimerPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
