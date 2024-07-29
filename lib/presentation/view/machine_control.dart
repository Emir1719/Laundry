import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';
import 'package:laundry/presentation/widget/buttons/setting_row.dart';
import 'package:laundry/presentation/widget/machine_listbuilder.dart';

class MachineControlView extends StatelessWidget {
  const MachineControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Makine Kontrol")),
      body: Column(
        children: [
          const BtnRowMachineSetting(),
          Expanded(
            child: GetBuilder<MachineController>(
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
          ),
        ],
      ),
    );
  }
}
