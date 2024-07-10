import 'package:flutter/material.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/presentation/view/machine_info_sheet/machine_detail.dart';
import 'package:laundry/presentation/view/machine_info_sheet/note_detail.dart';

class MachineSetting extends StatelessWidget {
  const MachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20, width: 20);
    final style = locator<AppStyle>();

    List<Widget> components = [
      const MachineDetail(),
      space,
      const NotDetail(),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: style.machineSettingContainer(),
      child: Column(children: components),
    );
  }
}
