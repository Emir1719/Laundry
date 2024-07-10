import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/light_theme.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/firebase_options.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/domain/repository/database_repository.dart';

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
    final repository = locator<DatabaseRepository>();

    return GetMaterialApp(
      title: "Çamaşırhane",
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().theme(),
      getPages: AppRoute.appRoutes(),
      initialRoute: repository.isUserLogin() ? AppRoute.home : AppRoute.register,
      defaultGlobalState: true,
      //home: repository.isUserLogin() ? const HomeView() : const RegisterView(),
    );
  }
}
