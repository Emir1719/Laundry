import 'package:flutter/material.dart';

class MachineCountText extends StatelessWidget {
  const MachineCountText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "Makinelerin Doluluk Oranı\n(3 / 6)",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
