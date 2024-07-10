import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/locator.dart';

class BtnScanQR extends StatelessWidget {
  const BtnScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return TextButton(
      onPressed: () => Get.toNamed(AppRoute.qr),
      style: style.getMainButtons(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code, size: style.mainButtonIconSize),
          SizedBox(height: style.mainButtonSpaceBetween),
          const Text("QR Okut", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
