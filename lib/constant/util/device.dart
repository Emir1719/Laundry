import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDevice {
  /// Şu anki ekran konumunu verir.
  static Orientation get orientation => MediaQuery.of(Get.context!).orientation;

  /// Cihaın yüksekliğini verir.
  static double get height => MediaQuery.of(Get.context!).size.height;

  /// Cihaın genişliğini verir.
  static double get width => MediaQuery.of(Get.context!).size.width;

  /// Şu anki ekran konumu dikey mi?
  static bool get isPortrait => orientation == Orientation.portrait;
}
