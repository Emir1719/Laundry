import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/machine_controller.dart';

class BtnDeleteMachine extends StatelessWidget {
  const BtnDeleteMachine({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());

    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
        onPressed: controller.deleteMachine,
        icon: const Icon(Icons.delete),
        label: const Text("Makineyi Sil"),
      ),
    );
  }
}
