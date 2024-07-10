// ignore_for_file: unused_field
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/locator.dart';

class AppMessage {
  static void show({required String title, required String message, Type type = Type.success}) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      icon: const Icon(Icons.info, size: 28, color: Colors.white),
      shouldIconPulse: false,
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: type.color,
    ));
  }

  static void showAlertDialog({
    required BuildContext context,
    required void Function()? onSuccess,
    required String title,
    required String message,
    void Function()? onFail,
  }) {
    final style = locator<AppStyle>();

    AlertDialog alert = AlertDialog(
      title: Text(title, style: style.alertTitle),
      content: Text(message, style: style.alertYesNoBtn),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      actions: [
        TextButton(
          child: Text("Evet", style: style.alertYesNoBtn),
          onPressed: () {
            Navigator.pop(context);
            onSuccess!();
          },
        ),
        TextButton(
          child: Text("Hayır", style: style.alertYesNoBtn),
          onPressed: () {
            Navigator.pop(context);
            if (onFail != null) {
              onFail();
            }
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

enum Type {
  success(Colors.green),
  warning(Colors.orange),
  error(Colors.red);

  final Color color;

  const Type(this.color);
}
