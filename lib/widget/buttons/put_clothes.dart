import 'package:flutter/material.dart';

class BtnPutClothes extends StatelessWidget {
  const BtnPutClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text("Çamaşırları Makineye Koydum"),
      icon: const Icon(Icons.task_alt_outlined),
    );
  }
}
