import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/view/qr_scanner.dart';

class BtnScanQR extends StatelessWidget {
  const BtnScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Get.to(const QRCodeScannerView());
        //Get.to(() => const FormView());
      },
      label: const Text("QR Okut"),
      icon: const Icon(Icons.task_alt_outlined),
    );
  }
}
