// ignore_for_file: unused_field
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppMessage {
  static void show({required String title, required String message, Type type = Type.success}) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      icon: const Icon(Icons.info, size: 28, color: Colors.white),
      shouldIconPulse: false,
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: type.color,
    ));
  }
}

enum Type {
  success(Colors.green),
  warning(Colors.orange),
  error(Colors.red);

  final Color color;

  const Type(this.color);
}
