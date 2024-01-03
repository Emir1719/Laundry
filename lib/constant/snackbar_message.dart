import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:laundry/constant/color.dart';
import 'package:laundry/locator.dart';

class AppMessage {
  final _color = locator<AppColor>();

  void showSuccessMessage({required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      icon: const Icon(Icons.task_alt_outlined, size: 28, color: Colors.white),
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: _color.green!,
    ));
  }
}
