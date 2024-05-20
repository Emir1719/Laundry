import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/auth_controller.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please verify your email address.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //authController.sendEmailVerification();
              },
              child: const Text('Resend Verification Email'),
            ),
            const SizedBox(height: 20),
            /*Obx(
              () => Text(
                authController.isEmailVerified.value
                    ? 'Email is verified! Please restart the app.'
                    : 'Email is not verified yet.',
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
