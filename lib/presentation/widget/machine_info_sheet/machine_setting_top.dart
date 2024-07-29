import 'package:flutter/material.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/util/constant/style.dart';

class MachineSettingTopSection extends StatelessWidget {
  const MachineSettingTopSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(borderRadius: BorderRadius.zero),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(title, style: style.machineSettingTitle.copyWith(color: Colors.white)),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
