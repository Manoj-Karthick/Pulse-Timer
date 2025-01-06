import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mode/bloc/mode_bloc.dart';

class ModePage extends StatelessWidget {
  const ModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModeBloc(),
      child: ModeView(),
    );
  }
}

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
