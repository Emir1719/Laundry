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
      appBar: AppBar(title: const Text("Makine Ayarları")),
      body: FutureBuilder(
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
      ),
    );
  }
}
