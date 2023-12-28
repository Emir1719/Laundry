import 'package:flutter/material.dart';

class AppImage {
  static AppImage? _instance;

  AppImage._();

  // Singleton örneğine erişim sağlayan statik metot
  static AppImage getInstance() {
    _instance ??= AppImage._();
    return _instance!;
  }

  final washing = Image.asset("assets/images/washing1.gif", height: 250);
  final washingDone = Image.asset("assets/images/done1.gif", height: 250);
  final logo = Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Image.asset("assets/images/logo.png", height: 200),
  );
}
