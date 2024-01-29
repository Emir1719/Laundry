import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/controller/machine_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/database_repository.dart';

class BtnRowMachineSetting extends StatelessWidget {
  const BtnRowMachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());
    final style = locator<AppStyle>();
    final repo = locator<DatabaseRepository>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: controller.onTabShowQueue,
          icon: const Icon(Icons.people),
          label: Row(
            children: [
              const Text("Yıkama Sırası"),
              GetBuilder<MachineController>(
                builder: (controller) {
                  return FutureBuilder(
                    future: repo.getAllUserFromQueue(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: Text(
                          snapshot.data!.length.toString(),
                          style: style.queueCount,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        TextButton.icon(
          onPressed: controller.addMachine,
          icon: const Icon(Icons.add),
          label: const Text("Makine Ekle"),
        )
      ],
    );
  }
}
