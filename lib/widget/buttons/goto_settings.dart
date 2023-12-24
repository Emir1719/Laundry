import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/view/settings.dart';

class BtnGotoSettings extends StatelessWidget {
  const BtnGotoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(const SettingsView());
      },
      icon: const Icon(Icons.settings),
    );
  }
}
