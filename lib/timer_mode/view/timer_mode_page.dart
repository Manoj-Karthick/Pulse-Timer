import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/timer_mode/bloc/timer_mode_bloc.dart';

class TimerModePage extends StatelessWidget {
  const TimerModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerModeBloc(),
      child: TimerModeView(),
    );
  }
}

class TimerModeView extends StatelessWidget {
  const TimerModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerModeBloc, TimerModeState>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<TimerModeBloc>().add(
                    TimerModeChanged(mode: TimerMode.shortBreak),
                  );
            },
            child: const Text('Short Break'),
            style: ElevatedButton.styleFrom(
              foregroundColor: state.mode == TimerMode.shortBreak
                  ? Colors.white
                  : Colors.black,
              backgroundColor: state.mode == TimerMode.shortBreak
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.secondary,
              // Text color
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
              // Button size
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust border radius here
              ),
              elevation: 2,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TimerModeBloc>().add(
                    TimerModeChanged(mode: TimerMode.focus),
                  );
            },
            child: const Text('Focus'),
            style: ElevatedButton.styleFrom(
              foregroundColor:
                  state.mode == TimerMode.focus ? Colors.white : Colors.black,
              backgroundColor: state.mode == TimerMode.focus
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.secondary,
              // Text color
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
              // Button size
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust border radius here
              ),
              elevation: 2,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TimerModeBloc>().add(
                    TimerModeChanged(mode: TimerMode.longBreak),
                  );
            },
            child: const Text('Long Break'),
            style: ElevatedButton.styleFrom(
              foregroundColor: state.mode == TimerMode.longBreak
                  ? Colors.white
                  : Colors.black,
              backgroundColor: state.mode == TimerMode.longBreak
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.secondary,
              // Text color
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
              // Button size
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust border radius here
              ),
              elevation: 2,
            ),
          ),
        ],
      );
    });
  }
}
