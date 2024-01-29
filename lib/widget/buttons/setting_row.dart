import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/color.dart';
import 'package:laundry/controller/machine_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/widget/washing_queue_count.dart';

class BtnRowMachineSetting extends StatelessWidget {
  const BtnRowMachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());
    final color = locator<AppColor>();

    return Container(
      color: color.background,
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
