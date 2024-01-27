import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/machine_controller.dart';
import 'package:laundry/widget/machine_listbuilder.dart';

class MachineControlView extends StatelessWidget {
  const MachineControlView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Makine Ayarları"),
        actions: [
          IconButton(onPressed: controller.onTabShowQueue, icon: const Icon(Icons.manage_accounts_outlined)),
          IconButton(onPressed: controller.addMachine, icon: const Icon(Icons.add_circle_outline_outlined)),
        ],
      ),
      body: GetBuilder<MachineController>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.repository.getMachines(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Hata: ${snapshot.error}");
              }
              controller.machines.value = snapshot.data!;

              return const MachineListBuilder();
            },
          );
        },
      ),
    );
  }
}
