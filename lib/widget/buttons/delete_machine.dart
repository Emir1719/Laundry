import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/snackbar_message.dart';
import 'package:laundry/controller/machine_controller.dart';

class BtnDeleteMachine extends StatelessWidget {
  const BtnDeleteMachine({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {
          AppMessage.showAlertDialog(
            context: context,
            title: "Silmek istediğinize emin misiniz?",
            message: "Makine kalıcı olarak silinecek",
            onSuccess: () {
              controller.deleteMachine();
            },
          );
        },
        icon: const Icon(Icons.delete),
        label: const Text("Sil"),
      ),
    );
  }
}
