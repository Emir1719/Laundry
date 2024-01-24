import 'package:flutter/material.dart';

class AppStyle {
  TextStyle baseTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  late TextStyle listTileTitle, listTileSubtitle, countText, machineSetting, machineSettingTitle, machineSettingOption;

  AppStyle() {
    listTileTitle = baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    machineSetting = baseTextStyle.copyWith(
      fontSize: 18,
    );
    machineSettingOption = baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    listTileSubtitle = baseTextStyle.copyWith(
      fontWeight: FontWeight.w400,
    );
    countText = baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    machineSettingTitle = baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  Color? getColorListTile(int index) {
    // Tek ve çift sıradaki elemanları belirle
    bool isOdd = index % 2 != 1;
    // Arka plan rengini belirle
    Color? backgroundColor = isOdd ? Colors.grey[300] : Colors.grey[100];
    return backgroundColor;
  }
}
