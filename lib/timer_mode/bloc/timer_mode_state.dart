part of 'timer_mode_bloc.dart';

class TimerModeState {
  final TimerMode mode;
  final int duration;

  const TimerModeState({required this.mode, required this.duration});

  TimerModeState copyWith({TimerMode? mode, int? duration}) {
    return TimerModeState(
        mode: mode ?? this.mode, duration: duration ?? this.duration);
  }
}

enum TimerMode {
  focus,
  shortBreak,
  longBreak,
}
