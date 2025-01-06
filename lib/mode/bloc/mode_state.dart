part of 'mode_bloc.dart';

class ModeState {
  final TimerMode mode;
  final int duration;

  const ModeState({required this.mode, required this.duration});

  ModeState copyWith({ModeState? mode, int? duration}) {
    return ModeState(
        mode: (mode ?? this.mode) as TimerMode,
        duration: duration ?? this.duration);
  }
}
