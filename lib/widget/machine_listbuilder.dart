import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/controller/machine_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/widget/buttons/machine_button.dart';

class MachineListBuilder extends StatelessWidget {
  const MachineListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());

    return FutureBuilder(
      future: controller.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.machines.length,
          itemBuilder: (context, index) {
            return _buildListTile(index);
          },
        );
      },
    );
  }

  /// Listtile öğesini oluşturur.
  Widget _buildListTile(int index) {
    final style = locator<AppStyle>();
    return GetBuilder<MachineController>(
      builder: (controller) {
        return ListTile(
          onTap: () => controller.onTab(index),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          tileColor: style.getColorListTile(index),
          title: Text("${index + 1}. Makine (${controller.getType(index)})", style: style.listTileTitle),
          subtitle: Text(controller.getSubtitle(index), style: style.listTileSubtitle),
          trailing: controller.machines[index].isActive
              ? BtnMachine(index: index)
              : null, // makine aktif değilse icon gözükmesin
        );
      },
    );
  }
}
