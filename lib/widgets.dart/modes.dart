import 'package:flutter/material.dart';

class Modes extends StatelessWidget {
  const Modes(this.modeName, this.isActive, {super.key});

  final String modeName;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        modeName,
        style: TextStyle(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
