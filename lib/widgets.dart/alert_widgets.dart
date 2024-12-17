import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(text),
    );
  }
}

Future<dynamic> myShowDialog(context, text) {
  return showDialog(
    context: context,
    builder: (context) {
      return MyAlertDialog(text);
    },
  );
}
