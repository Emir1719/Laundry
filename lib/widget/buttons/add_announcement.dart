import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';

class BtnEnterAnnoencement extends StatelessWidget {
  const BtnEnterAnnoencement({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return TextButton(
      onPressed: () => Get.toNamed(AppRoute.addAnnouncement),
      style: style.getMainButtons(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.control_point, size: style.mainButtonIconSize),
          SizedBox(height: style.mainButtonSpaceBetween),
          const Text("Duyuru Gir", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
