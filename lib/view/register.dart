import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';
import 'package:laundry/view/login.dart';
import 'package:laundry/widget/auth_form.dart';
import 'package:laundry/widget/text_form_fields/text_name.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    const space = 20.0;

    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextName(
            onChanged: (value) => controller.name.value = value,
          ),
          const SizedBox(height: space),
          AuthForm(formKey: controller.registerFormKey),
          const SizedBox(height: space),
          ElevatedButton.icon(
            onPressed: controller.register,
            label: const Text("Kayıt Ol"),
            icon: const Icon(Icons.login_rounded),
          ),
          const SizedBox(height: space),
          TextButton.icon(
            onPressed: () => Get.to(const LoginView(), popGesture: false),
            icon: const Icon(Icons.person),
            label: const Text("Hesabınız var mı? Giriş yapın"),
          ),
        ],
      ),
    );
  }
}
