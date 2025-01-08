import 'package:bloc/bloc.dart';

part 'timer_mode_event.dart';
part 'timer_mode_state.dart';

class TimerModeBloc extends Bloc<TimerModeEvent, TimerModeState> {
  TimerModeBloc()
      : super(TimerModeState(mode: TimerMode.focus, duration: 25 * 60)) {
    on<TimerModeChanged>(_onModeChanged);
  }

  void _onModeChanged(TimerModeChanged event, Emitter<TimerModeState> emit) {
    final int newDuration;
    switch (event.mode) {
      case TimerMode.focus:
        newDuration = 25 * 60;
      case TimerMode.shortBreak:
        newDuration = 5 * 60;
      case TimerMode.longBreak:
        newDuration = 15 * 60;
    }

    emit(state.copyWith(mode: event.mode, duration: newDuration));
  }
}
