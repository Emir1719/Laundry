import 'package:flutter/material.dart';

class AppCircleProgress extends StatelessWidget {
  const AppCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(child: Center(child: CircularProgressIndicator()));
  }
}
