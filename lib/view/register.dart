import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/widget/auth_form.dart';
import 'package:laundry/widget/text_name.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt")),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextName(
              onChanged: (value) => controller.name.value = value,
            ),
            const SizedBox(height: 20),
            AuthForm(formKey: controller.registerFormKey),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: controller.register,
              label: const Text("Kayıt Ol"),
              icon: const Icon(Icons.login_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
