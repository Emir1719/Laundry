import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/light_theme.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());

    return GetMaterialApp(
      title: "Çamaşırhane",
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      getPages: AppRoute.appRoutes(),
      initialRoute: AppRoute.splash,
      defaultGlobalState: true,
    );
  }
}
