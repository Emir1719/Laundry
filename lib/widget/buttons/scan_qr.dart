import 'package:flutter/material.dart';

class BtnScanQR extends StatelessWidget {
  const BtnScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text("QR Okut"),
      icon: const Icon(Icons.task_alt_outlined),
    );
  }
}
