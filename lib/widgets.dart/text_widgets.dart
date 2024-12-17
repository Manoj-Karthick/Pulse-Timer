import 'package:flutter/material.dart';

class MyTextFieldOutline extends StatelessWidget {
  const MyTextFieldOutline(
      {required this.placeholder, required this.ctrler, super.key});

  final TextEditingController ctrler;
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: placeholder,
      ),
      controller: ctrler,
    );
  }
}

class MyTextFieldUnderLine extends StatelessWidget {
  const MyTextFieldUnderLine({required this.placeholder, super.key});

  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: placeholder,
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({required this.placeholder, super.key});

  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: placeholder,
      ),
    );
  }
}
