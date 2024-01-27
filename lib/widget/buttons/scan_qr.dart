import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';

class BtnScanQR extends StatelessWidget {
  const BtnScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Get.toNamed(AppRoute.qr),
      label: const Text("QR Okut"),
      icon: const Icon(Icons.task_alt_outlined),
    );
  }
}
