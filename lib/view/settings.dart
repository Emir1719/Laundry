import 'package:flutter/material.dart';
import 'package:laundry/widget/buttons/sign_out.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BtnSignOut(),
          ],
        ),
      ),
    );
  }
}
