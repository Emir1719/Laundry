import 'package:flutter/material.dart';
import 'package:laundry/constant/color.dart';
import 'package:laundry/locator.dart';

class AppStyle {
  final color = locator<AppColor>();

  TextStyle baseTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  late TextStyle listTileTitle,
      listTileSubtitle,
      countText,
      machineSetting,
      machineSettingTitle,
      machineSettingOption,
      announcementTitle,
      announcementContent,
      queueCount,
      alertYesNoBtn,
      alertTitle;

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
    announcementTitle = baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    announcementContent = baseTextStyle.copyWith(
      height: 1.6,
    );
    queueCount = baseTextStyle.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
    alertYesNoBtn = baseTextStyle.copyWith(fontSize: 18);
    alertTitle = baseTextStyle.copyWith(
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

  BoxDecoration shortAnnouncementContainer() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2,
        ),
        BoxShadow(
          color: Colors.deepOrange,
          blurRadius: 5,
          blurStyle: BlurStyle.inner,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  BoxDecoration machineSettingContainer() {
    return BoxDecoration(
      color: color.background,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    );
  }
}
