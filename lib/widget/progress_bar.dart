import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';

class AppCircleProgress extends StatelessWidget {
  const AppCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    if (controller.isLoading.value) {
      return const Positioned.fill(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return const SizedBox();
  }
}
