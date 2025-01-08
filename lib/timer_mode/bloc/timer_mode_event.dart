part of 'timer_mode_bloc.dart';

sealed class TimerModeEvent {
  const TimerModeEvent();
}

final class TimerModeChanged extends TimerModeEvent {
  final TimerMode mode;

  const TimerModeChanged({required this.mode});
}
