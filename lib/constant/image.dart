import 'package:flutter/material.dart';

class AppImage {
  static AppImage? _instance;

  AppImage._();

  // Singleton örneğine erişim sağlayan statik metot
  static AppImage getInstance() {
    _instance ??= AppImage._();
    return _instance!;
  }

  final washing = Image.asset("assets/images/washing.gif", height: 250);
  final washingDone = Image.asset("assets/images/done.gif", height: 250);
}
