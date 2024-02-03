import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/signout_controller.dart';

class BtnSignOut extends StatelessWidget {
  const BtnSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(SignOutController());

    return ElevatedButton.icon(
      onPressed: cont.onTab,
      label: const Text("Çıkış Yap"),
      icon: const Icon(Icons.group_off_outlined),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
      ),
    );
  }
}
