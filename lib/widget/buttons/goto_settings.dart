import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';

class BtnGotoSettings extends StatelessWidget {
  const BtnGotoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.toNamed(AppRoute.setting),
      icon: const Icon(Icons.settings),
    );
  }
}
