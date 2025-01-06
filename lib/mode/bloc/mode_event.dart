part of 'mode_bloc.dart';

sealed class ModeEvent {
  const ModeEvent();
}

final class TimerModeChanged extends ModeEvent {
  final TimerMode mode;

  const TimerModeChanged({required this.mode});
}

enum TimerMode {
  focus,
  shortBreak,
  longBreak,
}
