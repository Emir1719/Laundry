import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';

class BtnMachine extends StatelessWidget {
  const BtnMachine({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MachineController>(
      builder: (controller) {
        return IconButton(
          icon: controller.iconBtnStates[index] ? const Icon(Icons.add) : const Icon(Icons.remove),
          iconSize: 35,
          color: Colors.black,
          onPressed: () => controller.iconBtnStates[index]
              ? controller.onTabIconBtnAdd(index)
              : controller.onTabIconBtnRemove(index),
        );
      },
    );
  }
}
