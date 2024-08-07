import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/presentation/widget/washing_queue_count.dart';

class BtnRowMachineSetting extends GetView<MachineController> {
  const BtnRowMachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return Container(
      decoration: style.machineSettingTopContainer(),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: controller.onTabShowQueue,
            icon: const Icon(Icons.people),
            label: const Row(
              children: [
                Text("Yıkama Sırası"),
                WashingQueueCount(),
              ],
            ),
          ),
          const SizedBox(width: 15),
          TextButton.icon(
            onPressed: controller.addMachine,
            icon: const Icon(Icons.add),
            label: const Text("Makine Ekle"),
          )
        ],
      ),
    );
  }
}
