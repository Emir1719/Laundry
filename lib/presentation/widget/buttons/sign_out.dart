import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/signout_controller.dart';

class BtnSignOut extends StatelessWidget {
  const BtnSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(SignOutController());

    return IconButton(
      onPressed: cont.onTab,
      icon: const Icon(Icons.group_off_outlined),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    );
  }
}
