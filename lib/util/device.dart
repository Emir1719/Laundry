import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDevice {
  /// Şu anki ekran konumunu verir.
  static Orientation get orientation => MediaQuery.of(Get.context!).orientation;

  /// Cihazın yüksekliğini verir.
  static double get height => MediaQuery.of(Get.context!).size.height;

  /// Cihazın genişliğini verir.
  static double get width => MediaQuery.of(Get.context!).size.width;

  /// Şu anki ekran konumu dikey mi?
  static bool get isPortrait => orientation == Orientation.portrait;

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
