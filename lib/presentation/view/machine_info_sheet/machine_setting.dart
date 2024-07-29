import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:laundry/presentation/widget/machine_info_sheet/machine_setting_top.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/presentation/view/machine_info_sheet/machine_detail.dart';
import 'package:laundry/presentation/view/machine_info_sheet/note_detail.dart';

class MachineSetting extends StatelessWidget {
  const MachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20, width: 20);
    final style = locator<AppStyle>();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: style.machineSettingContainer().copyWith(color: Colors.grey.shade300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MachineSettingTopSection(title: "Makine Ayarları"),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: style.machineSettingContainer().copyWith(borderRadius: const BorderRadius.all(Radius.zero)),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: const [
                  MachineDetail(),
                  space,
                  NotDetail(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
