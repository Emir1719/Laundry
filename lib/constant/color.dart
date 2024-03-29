import 'package:flutter/material.dart';

class AppColor {
  final primary = Colors.deepOrange;
  final background = const Color(0xffF8F9FA); //white
  final green = Colors.green[700];
  final machineBold = Colors.grey.shade300;
  final machineLight = Colors.grey.shade200;

  ///primary rengi Color'dan MaterialColor'a çevrildi.
  late MaterialColor primaryMaterialColor;
  final dynamic _primaryHexCode = 0xff24855B;

  AppColor() {
    primaryMaterialColor = MaterialColor(_primaryHexCode, {
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    });
  }
}
