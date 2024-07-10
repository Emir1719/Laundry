import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/light_theme.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/firebase_options.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/presentation/controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MainApp());
}

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
