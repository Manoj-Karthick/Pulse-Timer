import 'package:learn_flutter/Model/Mode.dart';

class Modes {
  const Modes();

  static const Map<String, dynamic> _mode = const {
    "ShortBreak": Mode(
      key: "ShortBreak",
      name: "Short Break",
      time: 5,
    ),
    "Focus": Mode(
      key: "Focus",
      name: "Focus",
      time: 25,
    ),
    "LongBreak": Mode(
      key: "LongBreak",
      name: "Long Break",
      time: 15,
    ),
  };

  Mode mode() {
    return _mode["Focus"];
  }
}
