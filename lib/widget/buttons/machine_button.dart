import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/machine_controller.dart';

class BtnMachine extends StatelessWidget {
  const BtnMachine({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());

    return IconButton(
      icon: controller.machines[index].userId.isEmpty ? const Icon(Icons.add) : const Icon(Icons.remove),
      iconSize: 35,
      color: Colors.black,
      onPressed: () => controller.onTabIconBtn(index),
    );
  }
}
