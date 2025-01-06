import 'package:bloc/bloc.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  ModeBloc() : super(ModeState(mode: TimerMode.focus, duration: 25 * 60)) {
    on<TimerModeChanged>(_onModeChanged);
  }

  void _onModeChanged(TimerModeChanged event, Emitter<ModeState> emit) {
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
