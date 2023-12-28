import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/image.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/widget/auth_form.dart';
import 'package:laundry/widget/progress_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final image = AppImage.getInstance();

    return Scaffold(
      appBar: AppBar(title: const Text("Giriş")),
      body: Obx(
        () => Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(20),
              children: [
                image.logo,
                AuthForm(formKey: controller.loginFormKey),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: controller.login,
                  label: const Text("Giriş Yap"),
                  icon: const Icon(Icons.login_rounded),
                ),
              ],
            ),
            const AppCircleProgress(),
          ],
        ),
      ),
    );
  }
}
