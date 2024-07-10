import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/presentation/widget/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KoskLogo(),
            SizedBox(height: 15),
            Text("Yükleniyor...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userController = UserController.call;
      userController.addListener(() {
        if (userController.user != null) {
          Get.offAllNamed(AppRoute.home);
        } else {
          Get.offAllNamed(AppRoute.register);
        }
      });
    });
  }
}
