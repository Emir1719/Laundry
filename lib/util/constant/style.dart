import 'package:flutter/material.dart';
import 'package:laundry/util/constant/color.dart';
import 'package:laundry/config/locator.dart';

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
      alertTitle,
      userQueue;

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
    userQueue = baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    countText = baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    machineSettingTitle = baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    announcementTitle = baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    announcementContent = baseTextStyle.copyWith(
      height: 1.6,
      color: Colors.grey.shade800,
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
    Color? backgroundColor = isOdd ? color.machineBold : color.machineLight;
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

  ButtonStyle getMainButtons() {
    return ButtonStyle(
      alignment: Alignment.center,
      fixedSize: MaterialStateProperty.all(const Size.fromWidth(100)),
    );
  }

  BoxDecoration announcementContainer() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 2),
        BoxShadow(
          color: Colors.deepOrange,
          blurRadius: 5,
          blurStyle: BlurStyle.inner,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  BoxDecoration machineSettingTopContainer() {
    return const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 1)),
      ],
    );
  }

  /// Ana ekrandaki butonlardaki icon boyutu
  double get mainButtonIconSize => 32.0;
  double get mainButtonSpaceBetween => 6.0;
}
