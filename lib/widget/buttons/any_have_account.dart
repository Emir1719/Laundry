import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';

class BtnAnyHaveAccount extends StatelessWidget {
  const BtnAnyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Get.toNamed(AppRoute.login);
      },
      icon: const Icon(Icons.person),
      label: const Text("Hesabınız var mı? Giriş yapın"),
    );
  }
}
