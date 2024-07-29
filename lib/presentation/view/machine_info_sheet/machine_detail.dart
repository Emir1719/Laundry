import 'package:flutter/material.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/presentation/widget/buttons/delete_machine.dart';
import 'package:laundry/presentation/widget/buttons/machine_setting_active.dart';
import 'package:laundry/presentation/widget/buttons/machine_setting_type.dart';

class MachineDetail extends StatelessWidget {
  const MachineDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20, width: 20);
    final style = locator<AppStyle>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Durum: ", style: style.machineSettingOption),
                    space,
                    const BtnMachineSetting(),
                  ],
                ),
                Row(
                  children: [
                    Text("Tür: ", style: style.machineSettingOption),
                    space,
                    const BtnMachineSettingType(),
                  ],
                ),
              ],
            ),
            const BtnDeleteMachine(),
          ],
        ),
      ],
    );
  }
}
