import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/firebase_auth_service.dart';

class BtnSignOut extends StatelessWidget {
  const BtnSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = locator<FirebaseAuthService>();

    return ElevatedButton.icon(
      onPressed: () async {
        bool result = await auth.signOut();
        if (result) {
          Get.toNamed(AppRoute.register);
        }
      },
      label: const Text("Çıkış Yap"),
      icon: const Icon(Icons.group_off_outlined),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
      ),
    );
  }
}
