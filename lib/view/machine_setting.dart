import 'package:flutter/material.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/widget/buttons/delete_machine.dart';
import 'package:laundry/widget/buttons/machine_setting.dart';
import 'package:laundry/widget/note_detail.dart';

class MachineSetting extends StatelessWidget {
  const MachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20, width: 20);
    final style = locator<AppStyle>();

    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text("Makine Ayarları", style: style.machineSettingTitle, textAlign: TextAlign.center),
          space,
          Row(
            children: [
              Text("Durum: ", style: style.machineSettingOption),
              space,
              const BtnMachineSetting(),
            ],
          ),
          const BtnDeleteMachine(),
          space,
          const NotDetail(),
        ],
      ),
    );
  }
}
