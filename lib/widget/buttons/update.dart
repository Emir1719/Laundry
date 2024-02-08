import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/setting.dart';

class BtnUpdate extends StatelessWidget {
  const BtnUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(SettingController());

    return ElevatedButton.icon(
      onPressed: cont.onTab,
      label: const Text("Güncelle"),
      icon: const Icon(Icons.update),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
      ),
    );
  }
}
