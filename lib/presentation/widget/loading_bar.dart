import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/widget/progress_bar.dart';

class LoadingBar {
  static Future<void> open() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: AppCircleProgress(),
          ),
        ),
      ),
    );
  }

  static void close() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
