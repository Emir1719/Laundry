import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';

class BtnRegister extends StatelessWidget {
  const BtnRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ElevatedButton.icon(
        onPressed: controller.register,
        label: const Text("Kayıt Ol"),
        icon: const Icon(Icons.login_rounded),
      ),
    );
  }
}
