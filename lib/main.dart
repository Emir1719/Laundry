import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/light_theme.dart';
import 'package:laundry/firebase_options.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/firebase_auth_service.dart';
import 'package:laundry/view/home.dart';
import 'package:laundry/view/register.dart';

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
    var auth = locator<FirebaseAuthService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      home: auth.isUserLogin() ? const HomeView() : const RegisterView(),
    );
  }
}
