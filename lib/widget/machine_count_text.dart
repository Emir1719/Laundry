import 'package:flutter/material.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';

class MachineCountText extends StatelessWidget {
  const MachineCountText({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Makinelerin Doluluk Oranı\n(3 / 5)",
        style: style.countText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
