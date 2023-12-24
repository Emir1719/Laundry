import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/view/register.dart';

class BtnSignOut extends StatelessWidget {
  const BtnSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = locator<FirebaseAuthService>();

    return ElevatedButton.icon(
      onPressed: () async {
        bool result = await auth.signOut();
        if (result) {
          Get.to(const RegisterView(), popGesture: false);
        }
      },
      label: const Text("Çıkış Yap"),
      icon: const Icon(Icons.task_alt_outlined),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
      ),
    );
  }
}
